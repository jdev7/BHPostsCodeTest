//
//  CDUser+CoreDataClass.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


public class CDUser: NSManagedObject {

    func toDictionary() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        if address != nil{
            dictionary["address"] = address!.toDictionary()
        }
        if company != nil{
            dictionary["company"] = company!.toDictionary()
        }
        if email != nil{
            dictionary["email"] = email
        }
        dictionary["id"] = id
        if name != nil{
            dictionary["name"] = name
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if username != nil{
            dictionary["username"] = username
        }
        if website != nil{
            dictionary["website"] = website
        }
        return dictionary
    }
    
}
