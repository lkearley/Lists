//
//  ViewController.swift
//  shoppingList
//
//  Created by Lauren Kearley on 10/3/17.
//  Copyright © 2017 LTK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var listTableView: UITableView!
    
    var listItems: [(listItemName: String, checked: Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listitem", for: indexPath) as! ItemTableViewCell
        
        cell.decorate(name: listItems[indexPath.row].listItemName, checked: listItems[indexPath.row].checked)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listItems[indexPath.row].checked = !listItems[indexPath.row].checked
        listTableView.reloadData()
        
    }

    @IBAction func addItem(_ sender: Any) {
        let alert = UIAlertController(title: "Add Item", message: "Please enter the item name", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "apples, oranges, etc."
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            let textField = alert.textFields!.first!
            if textField.text != "" {
                self.listItems.append((listItemName: textField.text!, checked: false))
            } else {
                let alert2 = UIAlertController(title: "Error", message: "Enter valid item name", preferredStyle: .alert)
                self.present(alert2, animated: true, completion: nil)
                return
            }
            self.listTableView.reloadData()
        }
        alert.addAction(cancel)
        alert.addAction(submit)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

