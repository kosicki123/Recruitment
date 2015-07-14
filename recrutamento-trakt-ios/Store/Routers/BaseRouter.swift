//
//  BaseRouter.swift
//  recrutamento-trakt-ios
//
//  Created by Renan Kosicki on 7/13/15.
//  Copyright (c) 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire

class BaseRouter {
    static func getRequestAfterSetup(method: Alamofire.Method, path: String) -> NSMutableURLRequest {
        let URL = NSURL(string: Constants.BaseURL.rawValue)!
        let URLRequest  = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        URLRequest.HTTPMethod = method.rawValue
        
        configureHeaders(URLRequest)
        
        return URLRequest
    }
    
    static func configureHeaders(URLRequest: NSMutableURLRequest) {
        URLRequest.setValue(Constants.ClientId.rawValue, forHTTPHeaderField: "trakt-api-key")
        URLRequest.setValue(Constants.APIVersion.rawValue, forHTTPHeaderField: "trakt-api-version")
    }
    
    static func getEncodingFor(method: Alamofire.Method) ->Alamofire.ParameterEncoding {
        switch method {
        case .GET:
            return Alamofire.ParameterEncoding.URL
        default:
            return Alamofire.ParameterEncoding.JSON
        }
    }
}