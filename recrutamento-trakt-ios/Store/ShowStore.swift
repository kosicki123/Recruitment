//
//  ShowStore.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ShowStore: NSObject {
    //TODO: retornar lista de shows
    static func getShows(callback: (response: JSON?) ->()) {
        request(Router.Shows()).responseSwiftyJSON { (request, response, json, error) -> Void in
            callback(response: json)
        }
    }
}