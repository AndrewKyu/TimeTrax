//
//  Project.swift
//  TimeTrax
//
//  Created by Bryan Cole on 4/28/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import Foundation

struct Project{
    var title: String
    var description: String
    var usersAssigned: [User]
    var startDate: Date
    var dueDate: Date
    var endDate: Date
    
    var dictionary: [String: Any]{
        return[
            "title" : title,
            "description" : description,
            "usersAssigned" : usersAssigned,
            "startDate" : startDate,
            "dueDate" : dueDate,
            "endDate" : endDate,
        ]
    }
}

extension Project: DocumentSerializable {
    init?(dictionary: [String : Any]){
        guard let title = dictionary["title"] as? String,
        let description = dictionary["description"] as? String,
        let usersAssigned = dictionary["usersAssigned"] as? [User],
        let startDate = dictionary["startDate"] as? Date,
        let dueDate = dictionary["dueDate"] as? Date,
        let endDate = dictionary["endDate"] as? Date else {return nil}
    
    self.init(title: title,
              description: description,
              usersAssigned: usersAssigned,
              startDate: startDate,
              dueDate: dueDate,
              endDate: endDate)
    }
}
