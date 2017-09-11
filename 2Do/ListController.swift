//
//  ListController.swift
//  2Do
//
//  Created by Dan Lindsay on 2017-09-11.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import CoreData

class ListController: UITableViewController {
    let identifier = "listItemCell"
    let managedObjectContext = CoreDataStack().managedObjectContext
    var items = [Item]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            items = try managedObjectContext.fetch(request)
        } catch {
            print("Error fetching item objects: \(error.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.text
        
        return cell
    }

}
