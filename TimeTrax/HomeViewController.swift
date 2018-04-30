//
//  HomeViewController.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/23/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FSCalendar
import FirebaseDatabase
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goToCreateTask", sender: self)
    }
    
    
    @IBOutlet weak var taskViewController: UITableView!
    
    var tasks = [TaskModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showTaskDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? TaskDetailViewController{
//            destination.task = structArray[(taskViewController.indexPathForSelectedRow?.row)!]
//        }
        
    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = taskViewController.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        //print(projects[indexPath.row].descriptionName)
        cell.projectNameLabel.text = "Project: \(tasks[indexPath.row].projectName ?? "")"
        cell.priorityLabel.text = "Priority: \(tasks[indexPath.row].priority ?? "")"
        cell.dueDate.text = "Due Date: \(tasks[indexPath.row].dueDate ?? "")"
        //cell.startDate.text = "Due Date: \(tasks[indexPath.row].startDate ?? "")"
        return cell
    }
    
    
    fileprivate func fetchData(){
        let reference = Database.database().reference().child("Task")
        reference.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            //print(snapshot.value)
            guard let tasksDictionary = snapshot.value as? [String: Any] else{ return }
            print(tasksDictionary)
            
            //clears out array
            self.tasks = []
            
            tasksDictionary.forEach({ (key, value) in
                if let individualTasks = value as? [String: String]{
                    print(individualTasks)
                    guard let taskName = individualTasks["taskName"] else{
                        return
                    }
                    guard let priorityNumber = individualTasks["priority"] else{
                        return
                    }
                    guard let dueDate = individualTasks["dueDate"] else{
                        return
                    }
                    guard let startDate = individualTasks["startDate"] else{
                        return
                    }
                    guard let projectName = individualTasks["projectName"] else{
                        return
                    }
                    print(taskName, priorityNumber, dueDate, startDate)
                    let task = TaskModel(taskName: taskName, startDate: startDate, dueDate: dueDate, priority: priorityNumber, projectName: projectName)
                    
                    self.tasks.append(task)
                }
                
            })
            DispatchQueue.main.async {
                self.taskViewController.reloadData()
            }
        }
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    
    //This view is used for displaying the table view listing of all the assigned tasks a user is currently on.

    override func viewDidLoad() {
        super.viewDidLoad()
        taskViewController.delegate = self
        taskViewController.dataSource = self
        
        //Navigation Bar Text, Color settings
    
//        navigationController?.navigationBar.barTintColor =
//            UIColor(red:0.90, green:0.19, blue:0.19, alpha:1.0)
//        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        
        // TODO: Database
        //query = baseQuery()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
//    var structArray =
//        [taskType(taskName: "Task 137", inProject: "Swift Project",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 1),
//         taskType(taskName: "Task 140", inProject: "Homework",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 2),
//         taskType(taskName: "Task 137B", inProject: "Swift Project",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 1),
//         taskType(taskName: "Task 195A", inProject: "Senior Project",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 2),
//         taskType(taskName: "Task 137C", inProject: "Swift Project",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 1),
//         taskType(taskName: "Task 166", inProject: "Homework",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 2),
//         taskType(taskName: "Task 137D", inProject: "Swift Project",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 1),
//         taskType(taskName: "Task Sleep", inProject: "Self",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 3),
//         taskType(taskName: "Task 137E", inProject: "Swift Project",taskDueDate: Date(), taskStartDate: Date(), taskprirority: 1)
//    ]
    

}



// View for Task Cell

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}

