//
//  CDComment+CoreDataProperties.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import CoreData


extension CDComment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDComment> {
        return NSFetchRequest<CDComment>(entityName: "CDComment");
    }

    @NSManaged public var body: String?
    @NSManaged public var email: String?
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var postId: Int16

}
