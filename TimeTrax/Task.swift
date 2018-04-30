//
//  Task.swift
//  TimeTrax
//
//  Created by John Tumath on 4/29/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import Foundation
//Class to hold task data

struct taskType{
    var name: String
    var dueDate: Date
    var startDate: Date
    var priority: Int
    var projectName: String
    var taskInProgress: Bool
    var timeStarted: Date?
    var totalTime: Int?
    var projectTimes: [taskTimes]?
    
    init(taskName name: String,
         inProject pjName: String,
         taskDueDate dueDate: Date,
         taskStartDate startDate: Date,
         taskprirority priority: Int) {
        
        self.name = name
        self.dueDate = dueDate
        self.priority = priority
        self.projectName = pjName
        self.taskInProgress = false
        self.startDate = startDate
    }
    
    struct taskTimes {
        var startTime: Date
        var finishTime: Date
    }

}
