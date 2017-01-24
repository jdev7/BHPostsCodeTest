//
//  CDUser+CoreDataClass.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData
import SugarRecord


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
        dictionary["id"] = Int(id)
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
    
    func bind(withUser user: User, context: Context) {
        email = user.email
        id = Int16(user.id)
        name = user.name
        phone = user.phone
        username = user.username
        website = user.website
        
        let cdAddress: CDAddress = try! context.new()
        cdAddress.bind(withAddress: user.address, context: context)
        address = cdAddress
        
        let cdCompany: CDCompany = try! context.new()
        cdCompany.bind(withCompany: user.company)
        company = cdCompany
    }
    
}
