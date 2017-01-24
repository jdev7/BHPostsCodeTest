//
//  CDPost+CoreDataProperties.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


extension CDPost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPost> {
        return NSFetchRequest<CDPost>(entityName: "CDPost");
    }

    @NSManaged public var body: String?
    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var userId: Int16

}
