//
//  ListController.swift
//  2Do
//
//  Created by Dan Lindsay on 2017-09-11.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import CoreData

public let listItemIdentifier = "listItemCell"

class ListController: UITableViewController {
    
    let segueIdentifier = "newItem"
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    lazy var dataSource: DataSource = {
        return DataSource(tableView: self.tableView, context: self.managedObjectContext)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    
    //MARK:  Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let navigationController = segue.destination as! UINavigationController
            let addTaskController = navigationController.topViewController as! AddTaskVC
            
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailVC, let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            let item = dataSource.object(at: indexPath)
            detailVC.item = item
            detailVC.context = self.managedObjectContext
        }
    }

}
















