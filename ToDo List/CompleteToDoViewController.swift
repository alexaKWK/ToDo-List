//
//  CompleteToDoViewController.swift
//  ToDo List
//
//  Created by Alexa Monarrez on 7/13/20.
//  Copyright © 2020 Alexa Monarrez. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?
   
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedToDo?.name
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
              context.delete(theToDo)
              navigationController?.popViewController(animated: true)
            }
          }
        }
       
    }
    
    //hello



