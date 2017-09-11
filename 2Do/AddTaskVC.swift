//
//  AddTaskVC.swift
//  2Do
//
//  Created by Dan Lindsay on 2017-09-11.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import CoreData

class AddTaskVC: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddTaskVC Context: \(managedObjectContext.description)")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: Any) {
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        item.text = text
        
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
    }
    
}
