//
//  CDCompany+CoreDataClass.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


public class CDCompany: NSManagedObject {

    func toDictionary() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        if bs != nil{
            dictionary["bs"] = bs
        }
        if catchPhrase != nil{
            dictionary["catchPhrase"] = catchPhrase
        }
        if name != nil{
            dictionary["name"] = name
        }
        return dictionary
    }
}
