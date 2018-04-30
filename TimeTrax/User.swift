//
//  User.swift
//  TimeTrax
//
//  Created by Bryan Cole on 4/28/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import Foundation

struct User{
    var email: String
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var jobTitle: String //could be enum
    var admin: Bool
    
    var dictionary: [String: Any] {
        return [
            "lastName" : lastName,
            "firstName" : firstName,
            "email" : email,
            "phoneNumber" : phoneNumber,
            "jobTitle" : jobTitle,
            "admin" : admin,
        ]
    }
}



