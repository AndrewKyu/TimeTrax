//
//  Task.swift
//  TimeTrax
//
//  Created by John Tumath on 4/29/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import Foundation
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
