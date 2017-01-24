//
//  CDGeo+CoreDataProperties.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


extension CDGeo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDGeo> {
        return NSFetchRequest<CDGeo>(entityName: "CDGeo");
    }

    @NSManaged public var lat: String?
    @NSManaged public var lng: String?

}
