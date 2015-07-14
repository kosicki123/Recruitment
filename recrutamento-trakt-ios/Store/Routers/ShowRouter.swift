//
//  ShowRouter.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

enum Router: URLRequestConvertible {
    
    case Shows()
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        let (method: Alamofire.Method, path: String, parameters: [String: AnyObject]?) = {
            var perPage = 20
            switch self {
            case .Shows():
                if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
                    perPage = 50
                }
                
                return (.GET, "/shows/popular", ["extended":"images", "limit": "\(perPage)"])
            }
        }()
        
        let encoding = BaseRouter.getEncodingFor(method)
        return encoding.encode(BaseRouter.getRequestAfterSetup(method, path: path), parameters: parameters).0
    }
}
