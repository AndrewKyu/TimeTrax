//
//  ProjectsViewController.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/27/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
//import FirebaseAuthUI
//import FirebaseGoogleAuthUI
//import FirebaseFirestore
//import SDWebImage


class ProjectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func createProjectButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goToCreateProject", sender: self)
    }
    
    var projects = [ProjectModel]()
    
  
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return projects.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! ProjectTableViewCell
        //print(projects[indexPath.row].descriptionName)
        cell.groupNameLabel.text = "Group Name: \(projects[indexPath.row].groupName ?? "")"
        cell.descriptionLabel.text = "Description: \(projects[indexPath.row].descriptionName ?? "")"
        cell.groupMembersLabel.text = "Group Members: \(projects[indexPath.row].groupMember ?? "")"
        return cell
    }
    
    fileprivate func fetchData(){
        let reference = Database.database().reference().child("project")
        reference.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            //print(snapshot.value)
            guard let projectsDictionary = snapshot.value as? [String: Any] else{ return }
            //print(projectsDictionary)
           
            //clears out array
            self.projects = []
            
            projectsDictionary.forEach({ (key, value) in
                if let individualProjects = value as? [String: String]{
                    print(individualProjects)
                    guard let groupName = individualProjects["groupName"] else{
                        return
                    }
                    guard let descriptionName = individualProjects["descriptionName"] else{
                        return
                    }
                    guard let groupMember = individualProjects["groupMember"] else{
                        return
                    }
                    print(groupName, descriptionName, groupMember)
                    let project = ProjectModel(groupName: groupName, descriptionName: descriptionName, groupMember: groupMember)
                    
                    self.projects.append(project)
                }
                
            })
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchData()
    }
    
}
