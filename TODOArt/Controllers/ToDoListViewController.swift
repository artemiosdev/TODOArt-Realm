//
//  ToDoListViewController.swift
//  TODOArt
//
//  Created by Artem Androsenko on 21.02.2022.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
    var itemArray = [Item]()
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
//        .first?.appendingPathComponent("Item.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(dataFilePath)
        loadItems()
        
    }
    
    //MARK: - TableView Datasourse Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
// update itemArray CoreDate in persistend Container (CRUD)
//        itemArray[indexPath.row].setValue("Completed", forKey: "title")
        
// delete itemArray CoreDate in persistend Container (CRUD)
        itemArray.remove(at: indexPath.row)
        context.delete(itemArray[indexPath.row])
        
//        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new TODOArt Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the Add Item button on our UIAlert
            
            let newItem = Item(context: self.context)
            
            newItem.title = textField.text!
            newItem.done = false
            self.itemArray.append(newItem)
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new items"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
  
    //MARK: - Model Manupulation Methods
    func saveItems() {
//       удаляем так как не изпользуем уже Encoder
//        let encoder = PropertyListEncoder()
        do {
           try context.save()
//       удаляем так как не изпользуем уже Encoder
//            let data = try encoder.encode(itemArray)
//            try data.write(to: dataFilePath!)
        } catch {
            print("Error saving context, \(error)")
//       удаляем так как не изпользуем уже Encoder
//            print("Error encoding item array, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
          itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    
}

//MARK: - Сode layout
extension ToDoListViewController {
    
    private func setupNavigationBar() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .systemBlue
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = coloredAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = coloredAppearance

        navigationController?.navigationBar.tintColor = UIColor.white
    }
}
