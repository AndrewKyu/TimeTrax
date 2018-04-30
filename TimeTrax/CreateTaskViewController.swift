//
//  CreateTaskViewController.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/29/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class CreateTaskViewController: UIViewController {

    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    
    @IBOutlet weak var startDateTextField: UITextField!
    
    
    @IBOutlet weak var dueDateTextField: UITextField!
    
    
    @IBOutlet weak var priorityTextField: UITextField!
    
    @IBAction func createTaskTapped(_ sender: UIButton) {
        createTask()
    }
    
    fileprivate func createTask(){
        guard let taskName = taskNameTextField.text else { return }
        guard let startDate = startDateTextField.text else { return }
        guard let dueDate = dueDateTextField.text else { return }
        guard let priority = priorityTextField.text else { return }
        guard let projectName = priorityTextField.text else { return }
        let task = [
            "taskName" : taskName,
            "startDate" : startDate,
            "dueDate" : dueDate,
            "priority" : priority,
            "projectName" : projectName
        ]
        
        Database.database().reference().child("task").child(taskName).updateChildValues(task) { (error, reference) in
            if let error = error {
                print(error)
                return
            }else{
                print("success")
                //self.dismiss(animated: true, completion: nil)
                self.navigationController!.popToRootViewController(animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
