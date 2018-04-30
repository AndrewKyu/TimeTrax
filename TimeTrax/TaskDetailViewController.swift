//
//  TaskDetailViewController.swift
//  TimeTrax
//
//  Created by John Tumath on 4/29/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import FirebaseAuthUI
import FirebaseGoogleAuthUI


class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var taskUserList: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskButton: UIButton!
    
    var task:taskType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = "Task: "
        taskName.text?.append((task?.name)!)
        projectName.text = "Project: "
        projectName.text?.append((task?.projectName)!)
        
        
    }

}
