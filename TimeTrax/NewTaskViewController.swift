//
//  NewTaskViewController.swift
//  TimeTrax
//
//  Created by Alex Norell on 4/29/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class NewTaskViewController: UIViewController {
    
    @IBAction func backToProjectsViewButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var groupNameTextField: UITextField!
    @IBOutlet weak var groupMembersTextField: UITextField!
    @IBOutlet weak var descriptionNameTextField: UITextField!
    
    @IBAction func createProjectButtonTapped(_ sender: UIButton) {
        createProjects()
    }
    
    fileprivate func createProjects(){
        guard let groupName = groupNameTextField.text else { return }
        guard let groupMember = groupMembersTextField.text else { return }
        guard let descriptionName = descriptionNameTextField.text else { return }
        let project = [
            "groupName" : groupName,
            "groupMember" : groupMember,
            "descriptionName" : descriptionName
            
        ]
        
        Database.database().reference().child("project").child(groupName).updateChildValues(project) { (error, reference) in
            if let error = error {
                print(error)
                return
            }else{
                print("success")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
}
