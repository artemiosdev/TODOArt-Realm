//
//  ViewController.swift
//  TODOArt
//
//  Created by Artem Androsenko on 21.02.2022.
//

import UIKit

class ToDoListViewController: UITableViewController {
    let itemArray = ["Example 1", "Example 2", "Example 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - TableView Datasourse Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
//      or
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
}

