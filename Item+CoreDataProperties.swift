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
        let request =  NSFetchRequest<Item>(entityName: "Item")
        
        request.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
        
        return request
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var text: String

}
