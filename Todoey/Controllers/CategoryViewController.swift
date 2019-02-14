//
//  CategoryViewController.swift
//  Todoey
//
//  Created by James Ogila on 08/02/2019.
//  Copyright © 2019 James Ogila. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories : Results<Category>?
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        loadCategories()

    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
       
        return cell
        
    }
    
    //MARK: - Tableview Delegate Methods - leave for now
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods - save data etc
    
    func save(category: Category) {
        do{
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category \(error)")
        }
        tableView.reloadData()
        
    
        
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
        
                }
    
    
    //MARK: - Add New Categories
    
@IBAction func addButtonItem(_ sender: UIBarButtonItem) {
    var textField = UITextField()
    
    // this is reference to the alert.addTextField bellow
    
    let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add", style: .default) { (action) in
        //What will happen once the user clicks the Add on our UIAlert
        
        let newCategory = Category()
        newCategory.name = textField.text!
        //newItem.done = false
        
        self.save(category: newCategory)
    }
    
    alert.addAction(action)
    
    alert.addTextField { (field) in
        textField = field //equal to the field created in th alert
        textField.placeholder = "Add a new category"
    }
    
    present(alert, animated: true, completion: nil)
    
    
}
    

}
    
    

