//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Alexa Monarrez on 7/13/20.
//  Copyright © 2020 Alexa Monarrez. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDoCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        getToDos()
    }
        
        func createToDos() -> [ToDo] {
            let swift = ToDo()
            swift.name = "Learn Swift"
            swift.important = true
            
            let dog = ToDo()
            dog.name = "Walk the Dog"
            return [swift, dog]
    }
    
    func getToDos() {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
       
    if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                    toDos = coreDataToDos
                    tableView.reloadData()
            }
        }
        
      }
    override func viewWillAppear(_ animated: Bool) {
      getToDos()
    }
    
    
    // MARK: - Table view data source

    //override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       //return 0
 //}
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return toDos.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
   let toDo = toDos[indexPath.row]
    if toDo.important {
        cell.textLabel?.text = "❗️" + toDo.name!
    } else {
        cell.textLabel?.text = toDo.name
    }
    return cell
   }

    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
    }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
        if let toDo = sender as? ToDoCD {
          completeVC.selectedToDo = toDo
          completeVC.previousVC = self
        }
   }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // this gives us a single ToDo
        let toDo = toDos[indexPath.row]

        performSegue(withIdentifier: "moveToComplete", sender: toDo)
          
    
}
}

}
