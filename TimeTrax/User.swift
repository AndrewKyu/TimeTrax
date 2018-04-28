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
    var profilePicture: URL?
    
    var dictionary: [String: Any] {
        return [
            "lastName" : lastName,
            "firstName" : firstName,
            "email" : email,
            "phoneNumber" : phoneNumber,
            "jobTitle" : jobTitle,
            "admin" : admin,
            "profilePicture" : profilePicture,
        ]
    }
}

extension User: DocumentSerializable {
    init?(dictionary: [String: Any]) {
        guard
            let email = dictionary["email"] as? String,
            let lastName = dictionary["lastName"] as? String,
            let firstName = dictionary["firstName"] as? String,
            let phoneNumber = dictionary["phoneNumber"] as? String,
            let jobTitle = dictionary["jobTitle"] as? String,
            let admin = dictionary["admin"] as? Bool,
            let profilePicture = dictionary["profilePicture"] as? URL else { return nil }
    
    
    self.init(lastName: lastName,
              firstName: firstName,
              email: email,
              phoneNumber: phoneNumber,
              jobTitle: jobTitle,
              admin: admin,
              profilePicture: profilePicture)
    }
}
