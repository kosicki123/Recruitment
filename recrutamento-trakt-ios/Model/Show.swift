//
//  Show.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation

@objc final class Show: ResponseObjectSerializable, ResponseCollectionSerializable {
    var title: String
    var image: String
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        title = representation.valueForKeyPath("title") as! String
        image = representation.valueForKeyPath("images.poster.thumb") as! String
    }
    
    class func collection(#response: NSHTTPURLResponse, representation: AnyObject) -> Array<Show> {
        var postArray = representation as! [AnyObject]
        
        return postArray.map({
            Show(response:response, representation: $0)!
        })
    }
}