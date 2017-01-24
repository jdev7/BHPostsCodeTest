//
//  ReadDataStoreRESTImplementation.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import Alamofire

typealias RESTClientSuccessBlock = (_ responseObject: AnyObject) -> Void
typealias RESTClientFailBlock = (_ error: NSError) -> Void

struct ReadDataStoreRESTImplementation: ReadDataStore {
    
    private let baseURL: String = "http://jsonplaceholder.typicode.com"
    
    
    func getPosts(success: @escaping ([Post]) -> (), error: @escaping (NSError) -> ()) {
        let urlString = "/posts"
        self.getUrl(urlString: urlString, success: { (results) in
            
            if let posts: [Post] = Post.parsePostsArray(object: results) {
                success(posts)
            }
            else {
                error(self.getError(message: "Malformed data received from \(self.baseURL + urlString) service", code: -90000))
            }
            
        }, fail: error)
    }
    
    func getUsers(success: @escaping ([User]) -> (), error: @escaping (NSError) -> ()) {
        let urlString = "/users"
        self.getUrl(urlString: urlString, success: { (results) in
            
            if let users: [User] = User.parseUsersArray(object: results) {
                success(users)
            }
            else {
                error(self.getError(message: "Malformed data received from \(self.baseURL + urlString) service", code: -90000))
            }
            
        }, fail: error)
    }
    
    func getComments(success: @escaping ([Comment]) -> (), error: @escaping (NSError) -> ()) {
        let urlString = "/comments"
        self.getUrl(urlString: urlString, success: { (results) in
            
            if let comments: [Comment] = Comment.parseCommentsArray(object: results) {
                success(comments)
            }
            else {
                error(self.getError(message: "Malformed data received from \(self.baseURL + urlString) service", code: -90000))
            }
            
        }, fail: error)
    }
    
    func getUrl(urlString: String, parameters: [String : Any]? = nil, success: @escaping RESTClientSuccessBlock, fail: @escaping RESTClientFailBlock) {
        
        let url = URL(string: baseURL + urlString)
        let headers = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(url!, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { (response) in
                
                if response.result.isSuccess {
                    if let jsonObject = response.result.value {
                        success(jsonObject as AnyObject)
                    }
                    else {
                        let error = self.getError(message: "Malformed data received from \(url!.absoluteString) service", code: -90000)
                        print(error)
                        fail(error)
                    }
                }
                else {
                    fail(response.result.error! as NSError)
                }
        }
        
    }
    
    private func getError(message: String, code: Int) -> NSError {
        return NSError(domain: "net.perhapps.BHPostsCodeTest.RestError", code: -90000, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
