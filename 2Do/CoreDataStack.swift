//
//  CoreDataStack.swift
//  2Do
//
//  Created by Dan Lindsay on 2017-09-06.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private(set) lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let endIndex = urls.index(before: urls.endIndex)
        
        return urls[endIndex]
    }()
    
    
    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
        let modelUrl = Bundle.main.url(forResource: "2Do", withExtension: "momd")!
        
        return NSManagedObjectModel(contentsOf: modelUrl)!
    }()
}
