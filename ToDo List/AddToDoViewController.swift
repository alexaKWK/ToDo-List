//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Alexa Monarrez on 7/13/20.
//  Copyright © 2020 Alexa Monarrez. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
   
    @IBOutlet weak var titleTextField: UITextField!
    
    var previousVC = ToDoTableViewController()
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let toDo = ToDo()
    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
        if let titleText = titleTextField.text {
        toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }

            try? context.save()

            navigationController?.popViewController(animated: true)
          
        if let titleText = titleTextField.text
        {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }
        //previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated : true )
     }
}
}
