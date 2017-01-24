//
//  CDPost+CoreDataClass.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


public class CDPost: NSManagedObject {

    func toDictionary() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        if body != nil{
            dictionary["body"] = body
        }
        dictionary["id"] = Int(id)
        if title != nil{
            dictionary["title"] = title
        }
        dictionary["userId"] = Int(userId)
        return dictionary
    }
    
    func bind(withPost post: Post) {
        body = post.body
        id = Int16(post.id)
        userId = Int16(post.userId)
        title = post.title
    }
}
