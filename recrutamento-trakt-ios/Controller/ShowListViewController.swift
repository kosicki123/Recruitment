//
//  ShowListViewController.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import UIKit

class ShowListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        requestShows()
    }
    
    func requestShows() {
        ShowStore.getShows { (response) -> () in
            println(response)
        }
    }
}
