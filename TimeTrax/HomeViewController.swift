//
//  HomeViewController.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/23/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import FSCalendar

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return structArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        let datething = structArray[indexPath.row].dueDate
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.short
        cell.dueDate.text = dateformatter.string(from: datething)
        cell.taskName.text = structArray[indexPath.row].name
        cell.prioritySymbol.text = structArray[indexPath.row].priority.rawValue
        return cell
    }
    
   
    @IBOutlet weak var taskViewController: UITableView!
    
    //This view is used for displaying the table view listing of all the assigned tasks a user is currently on.

    override func viewDidLoad() {
        super.viewDidLoad()
        taskViewController.delegate = self
        taskViewController.dataSource = self

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
    
    //Sample Data
    

    
    var structArray =
    [taskType(taskName: "Task 137", taskDueDate: Date(), taskprirority: Priority.high),
     taskType(taskName: "Task 140", taskDueDate: Date(), taskprirority: Priority.standard),
     taskType(taskName: "Task 137B", taskDueDate: Date(), taskprirority: Priority.high),
     taskType(taskName: "Task 195A", taskDueDate: Date(), taskprirority: Priority.standard),
     taskType(taskName: "Task 137C", taskDueDate: Date(), taskprirority: Priority.high),
     taskType(taskName: "Task 166", taskDueDate: Date(), taskprirority: Priority.standard),
     taskType(taskName: "Task 137D", taskDueDate: Date(), taskprirority: Priority.high),
     taskType(taskName: "Task Sleep", taskDueDate: Date(), taskprirority: Priority.low),
     taskType(taskName: "Task 137E", taskDueDate: Date(), taskprirority: Priority.high)
    ]
     

    enum Priority:String{
        case low
        case high
        case standard
    }
    struct taskType{
        var name: String
        var dueDate: Date
        var priority: Priority
        

        
        init(taskName name:String, taskDueDate dueDate: Date, taskprirority priority:Priority){
        
            self.name = name
            self.dueDate = dueDate
            self.priority = priority
        }
    }
}
