//
//  CoreDataStack.swift
//  2Do
//
//  Created by Dan Lindsay on 2017-09-06.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Foundation

class CoreDataStack {
    
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let endIndex = urls.index(before: urls.endIndex)
        
        return urls[endIndex]
    }()
}
