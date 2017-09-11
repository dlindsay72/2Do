//
//  Item+CoreDataProperties.swift
//  2Do
//
//  Created by Dan Lindsay on 2017-09-11.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var text: String

}
