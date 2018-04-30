//
//  NewTaskViewController.swift
//  TimeTrax
//
//  Created by Alex Norell on 4/29/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import Firebase


class NewTaskViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var projectGroup: UITextField!
    @IBOutlet weak var workersAssigned: UITextField!
    @IBOutlet weak var prioritySlider: UISlider!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var dueDate: UIDatePicker!
    
    @IBAction func createTaskTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.tabBarController?.navigationItem.title = "New Task"
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
