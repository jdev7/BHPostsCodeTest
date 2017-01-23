//
//  CDAddress+CoreDataClass.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


public class CDAddress: NSManagedObject {
    
    func toDictionary() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        
        if city != nil{
            dictionary["city"] = city
        }
        if geo != nil{
            dictionary["geo"] = geo!.toDictionary()
        }
        if street != nil{
            dictionary["street"] = street
        }
        if suite != nil{
            dictionary["suite"] = suite
        }
        if zipcode != nil{
            dictionary["zipcode"] = zipcode
        }
        return dictionary
    }
}
