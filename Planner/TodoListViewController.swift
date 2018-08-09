//
//  ViewController.swift
//  Planner
//
//  Created by 성곤 김 on 2018. 8. 9..
//  Copyright © 2018년 SeongKon Kim. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Study", "Work", "Grocery", "Exercise"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
                
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark)
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //selects and deselects animation
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

