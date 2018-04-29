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
import FirebaseFirestore
import FSCalendar

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var taskViewController: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return structArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showTaskDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TaskDetailViewController{
            destination.task = structArray[(taskViewController.indexPathForSelectedRow?.row)!]
        }
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        let datething = structArray[indexPath.row].dueDate
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.short
        cell.dueDate.text = dateformatter.string(from: datething)
        cell.taskName.text = structArray[indexPath.row].name
        cell.prioritySymbol.text = String (structArray[indexPath.row].priority)
        cell.projectName.text = structArray[indexPath.row].projectName
        return cell
    }
    
   
    
    
    //This view is used for displaying the table view listing of all the assigned tasks a user is currently on.

    override func viewDidLoad() {
        super.viewDidLoad()
        taskViewController.delegate = self
        taskViewController.dataSource = self
        
        //Navigation Bar Text, Color settings
    
        navigationController?.navigationBar.barTintColor =
            UIColor(red:0.90, green:0.19, blue:0.19, alpha:1.0)
        navigationController?.navigationBar.isTranslucent = false
        
        // TODO: Database
        //query = baseQuery()
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
    
    //Sample Data
    

    
    var structArray =
        [taskType(taskName: "Task 137", projectName: "Swift Project",taskDueDate: Date(), taskprirority: 1),
         taskType(taskName: "Task 140", projectName: "Homework",taskDueDate: Date(), taskprirority: 2),
         taskType(taskName: "Task 137B", projectName: "Swift Project",taskDueDate: Date(), taskprirority: 1),
         taskType(taskName: "Task 195A", projectName: "Senior Project",taskDueDate: Date(), taskprirority: 2),
         taskType(taskName: "Task 137C", projectName: "Swift Project",taskDueDate: Date(), taskprirority: 1),
         taskType(taskName: "Task 166", projectName: "Homework",taskDueDate: Date(), taskprirority: 2),
         taskType(taskName: "Task 137D", projectName: "Swift Project",taskDueDate: Date(), taskprirority: 1),
         taskType(taskName: "Task Sleep", projectName: "Self",taskDueDate: Date(), taskprirority: 3),
         taskType(taskName: "Task 137E", projectName: "Swift Project", taskDueDate: Date(), taskprirority: 1)
    ]
     

}

//Class to hold task data

    class taskType{
        var name: String
        var dueDate: Date
        var priority: Int
        var projectName: String
        
        init(taskName name:String, projectName pjName:String, taskDueDate dueDate: Date, taskprirority priority:Int){
        
            self.name = name
            self.dueDate = dueDate
            self.priority = priority
            self.projectName = pjName
        }
    }

// View for Task Cell

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var prioritySymbol: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var taskName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

