//
//  DetailVC.swift
//  2Do
//
//  Created by Dan Lindsay on 2017-09-11.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import CoreData

class DetailVC: UIViewController {
    
    var item: Item?
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var detailTextField: UITextField!
    
    override func viewDidLoad() {
        if let item = item {
            detailTextField.text = item.text
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
        if let item = item, let newText = detailTextField.text {
            item.text = newText
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        if let item = item {
            context.delete(item)
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
