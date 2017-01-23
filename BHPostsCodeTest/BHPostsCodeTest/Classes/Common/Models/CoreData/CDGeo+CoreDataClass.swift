//
//  CDGeo+CoreDataClass.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


public class CDGeo: NSManagedObject {

    func toDictionary() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        if lat != nil{
            dictionary["lat"] = lat
        }
        if lng != nil{
            dictionary["lng"] = lng
        }
        return dictionary
    }
}
