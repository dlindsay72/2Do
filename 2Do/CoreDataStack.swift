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
    
//    private(set) lazy var applicationDocumentsDirectory: URL = {
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let endIndex = urls.index(before: urls.endIndex)
//        
//        return urls[endIndex]
//    }()
//    
//    
//    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
//        let modelUrl = Bundle.main.url(forResource: "2Do", withExtension: "momd")!
//        
//        return NSManagedObjectModel(contentsOf: modelUrl)!
//    }()
//    
//    private(set) lazy var persistantStoreCoordinator: NSPersistentStoreCoordinator = {
//        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//        let url = self.applicationDocumentsDirectory.appendingPathComponent("2Do.sqlite")
//        
//        do {
//            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url)
//        } catch {
//            print(error)
//            abort()
//        }
//        
//        return coordinator
//    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let container = self.persistentContainer
        return container.viewContext
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "2Do")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
}























