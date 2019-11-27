//
//  PTNetworkManager.swift
//  Parati
//
//  Created by Smith Huamani on 27/04/18.
//  Copyright © 2018 Smith Huamani. All rights reserved.
//

import Foundation
import Alamofire
import Reachability
import SystemConfiguration

typealias CompletionBlock = (AnyObject?, AnyObject?) -> Void

class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    class func isConnectedToNetwork() -> Bool {
        let reachability: Reachability = Reachability.init()
        if(reachability.connection == .none){
            return false
            
        }else{
            
            return true
        }
    }
    let manager: Alamofire.SessionManager = {

        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        return Alamofire.SessionManager(
            configuration: configuration)
    }()
    
    public func callUrlWithCompletion(urlService:String!, url : String!, params : [String: AnyObject], completion : @escaping CompletionBlock, method: HTTPMethod) {
        let urlString = urlService.appending(url)
        print("REQUEST URL 📩📩📩📩📩📩 -->  \(urlString)")
        print("REQUEST BODY  📩📩📩📩📩📩 --> ",params)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        manager.request(urlString, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { (response) in
            print("RESPONSE BODY  📩📩📩📩📩📩 --> ",response)
            completion(response.response?.statusCode as AnyObject, response.result.value as AnyObject)
        })
    }

}
