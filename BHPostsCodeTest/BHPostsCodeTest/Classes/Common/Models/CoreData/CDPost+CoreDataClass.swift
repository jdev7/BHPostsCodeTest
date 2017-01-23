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
        dictionary["id"] = id
        if title != nil{
            dictionary["title"] = title
        }
        dictionary["userId"] = userId
        return dictionary
    }
}
