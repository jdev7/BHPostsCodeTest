//
//  CDAddress+CoreDataClass.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData
import SugarRecord

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
    
    func bind(withAddress address: Address, context: Context) {
        city = address.city
        street = address.street
        suite = address.suite
        zipcode = address.zipcode
        
        let cdGeo: CDGeo = try! context.new()
        cdGeo.bind(withGeo: address.geo)
        geo = cdGeo
    }
}
