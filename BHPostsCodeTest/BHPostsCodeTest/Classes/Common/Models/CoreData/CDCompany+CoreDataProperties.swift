//
//  CDCompany+CoreDataProperties.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


extension CDCompany {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCompany> {
        return NSFetchRequest<CDCompany>(entityName: "CDCompany");
    }

    @NSManaged public var bs: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var name: String?

}
