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
import FirebaseDatabase



class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var taskUserList: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskButton: UIButton!
    
    var task:taskType?
    
//    var tasks = [TaskModel]()
//
//
//
//    fileprivate func fetchData(){
//        let reference = Database.database().reference().child("task")
//        reference.observeSingleEvent(of: DataEventType.value) { (snapshot) in
//            //print(snapshot.value)
//            guard let tasksDictionary = snapshot.value as? [String: Any] else{ return }
//            print(tasksDictionary)
//
//            //clears out array
//            self.tasks = []
//
//            tasksDictionary.forEach({ (key, value) in
//                if let individualTasks = value as? [String: String]{
//                    print(individualTasks)
//                    guard let taskName = individualTasks["taskName"] else{
//                        return
//                    }
//                    guard let priorityNumber = individualTasks["priority"] else{
//                        return
//                    }
//                    guard let dueDate = individualTasks["dueDate"] else{
//                        return
//                    }
//                    guard let startDate = individualTasks["startDate"] else{
//                        return
//                    }
//                    guard let projectName = individualTasks["projectName"] else{
//                        return
//                    }
//                    print(taskName, priorityNumber, dueDate, startDate)
//                    let task = TaskModel(taskName: taskName, startDate: startDate, dueDate: dueDate, priority: priorityNumber, projectName: projectName)
//
//                    self.tasks.append(task)
//                }
//
//            })
//            DispatchQueue.main.async {
//                self.taskViewControllr.reloadData()
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = task?.name
        projectName.text = "Project: \(task?.projectName ?? "")"
        dueDate.text = "Due Date: \(task?.dueDate)"      
        
    }

}
