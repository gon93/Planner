//
//  ViewController.swift
//  Planner
//
//  Created by 성곤 김 on 2018. 8. 9..
//  Copyright © 2018년 SeongKon Kim. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Study", "Work", "Grocery", "Exercise"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = UserDefaults.standard.array(forKey: "Planner") as? [String]{
            itemArray = items
        }
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
        
        //Print text of the selected cell
        //print(itemArray[indexPath.row])
                
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
    
    
    //MARK - Add new Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New todo Item", message: "", preferredStyle: .alert)
       
        //If you  are in closure you need to use "self" to access the global variables.
        let action = UIAlertAction(title: "Add Item", style: .default){
            (action) in
            
            //What will happen once the user clicks the Add Item button on our UIAlert
            //print(textField.text)
            self.itemArray.append(textField.text!)

            //storing in local data
            self.defaults.set(self.itemArray, forKey: "Planner")
            
            //refreshe the UI
            self.tableView.reloadData()
        }
        
        //Add a textbox with placeholder, which disappears when the user enters texts.
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

