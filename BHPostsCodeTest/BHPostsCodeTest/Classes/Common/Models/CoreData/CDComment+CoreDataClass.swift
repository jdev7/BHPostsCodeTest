//
//  CDComment+CoreDataClass.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


public class CDComment: NSManagedObject {

    func toDictionary() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        if body != nil{
            dictionary["body"] = body
        }
        if email != nil{
            dictionary["email"] = email
        }
        dictionary["id"] = Int(id)
        if name != nil{
            dictionary["name"] = name
        }
        dictionary["postId"] = Int(postId)
        return dictionary
    }
    
    func bind(withComment comment: Comment) {
        body = comment.body
        email = comment.email
        id = Int16(comment.id)
        name = comment.name
        postId = Int16(comment.postId)
    }
}
