//
//  ShowListViewController.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import UIKit

class ShowListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorView: UIView!
    
    var shows: [Show] = []
    var refreshControl = UIRefreshControl()

    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        requestShows()
    }
    
    //MARK:- View Setup
    
    func setupView() {
        self.collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.collectionView.addSubview(refreshControl)
        self.collectionView.alwaysBounceVertical = true
        
        self.refreshControl.addTarget(self, action: "requestShows", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //MARK:- IBAction

    @IBAction func tryAgain(sender: AnyObject) {
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.errorView.hidden = true
            self.errorView.alpha = 0
        })
        
        activityIndicator.startAnimating()
        
        requestShows()
    }
    
    //MARK:- Request
    
    func requestShows() {
        ShowStore.getShows { (shows, error) -> () in
            if let error = error {
                return self.showError(error)
            }
            
            if let shows = shows {
                self.activityIndicator.stopAnimating()
                self.shows = shows
                self.collectionView.reloadData()
                self.collectionView.hidden = false
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    //MARK:- Error Handling
    
    func showError(error: NSError) {
        self.activityIndicator.stopAnimating()
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.errorView.hidden = false
            self.errorView.alpha = 1
        })
    }
    
    //MARK:- CollectionViewDataSource

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ShowCollectionCell
        
        cell.show = shows[indexPath.row]
        
        return cell
    }
}
