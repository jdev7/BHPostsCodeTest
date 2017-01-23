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
        dictionary["id"] = id
        if name != nil{
            dictionary["name"] = name
        }
        dictionary["postId"] = postId
        return dictionary
    }
}
