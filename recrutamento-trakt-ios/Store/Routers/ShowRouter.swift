//
//  ShowRouter.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let perPage = 50
    
    case Shows()
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        let (method: Alamofire.Method, path: String, parameters: [String: AnyObject]?) = {
            switch self {
            case .Shows():
                return (.GET, "/shows/popular", nil)
            }
        }()
        
        let encoding = BaseRouter.getEncodingFor(method)
        return encoding.encode(BaseRouter.getRequestAfterSetup(method, path: path), parameters: parameters).0
    }
}
