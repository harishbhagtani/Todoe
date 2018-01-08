//
//  ViewController.swift
//  Todoe
//
//  Created by Harish Bhagtani on 08/01/18.
//  Copyright © 2018 Harish Bhagtani. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Home","Shopping","Code"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - table view data souce method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - table view delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath.row, animated: true)
    }
    
    
    //MARK - Add new item
    
    @IBAction func addNewItem(_ sender: Any) {
        
        var actionTextField = UITextField()
        
        let alert = UIAlertController(title: "Add Item", message: "Add a new item to your TODO list.", preferredStyle: .alert)
        
        let actionAdd = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once we click the add item button on our alert
            itemArray.append(actionTextField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add Item"
            actionTextField = alertTextField
        }
        
        alert.addAction(actionAdd)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}

