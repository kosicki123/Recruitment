//
//  ShowStore.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire

class ShowStore: NSObject {
    static func getShows(callback: (shows: [Show]?, error: NSError?) ->()) {
        request(Router.Shows()).responseCollection { (request, response, shows: [Show]?, error) -> Void in
            if let error = error {
                return callback(shows: nil, error: error);
            }
            
            return callback(shows: shows, error: nil)
        }
    }
}