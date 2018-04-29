//
//  ProjectDetailsViewController.swift
//  TimeTrax
//
//  Created by Bryan Cole on 4/28/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseFirestore
import Firebase
import FirebaseAuthUI

class ProjectDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    var project: Project?
    var projectReference: DocumentReference?
    
    var localCollection: LocalCollection <User>!
    

    @IBOutlet weak var NavBar: UINavigationBar!
    @IBOutlet weak var ProjectDescription: UITextView!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    static func fromStoryboard(_ storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)) -> ProjectDetailsViewController {
        let controller = storyboard.instantiateViewController(withIdentifier: "ProjectDetailsViewController") as! ProjectDetailsViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = project?.title
        
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 20
        
        let query = projectReference!.collection("Users")
        localCollection = LocalCollection(query: query) { [unowned self] (changes) in
            if self.localCollection.count == 0 {
                return
            } else {
                self.tableView.backgroundView = nil
            }
            var indexPaths: [IndexPath] = []
            
            for addition in changes.filter({ $0.type == .added }) {
                let index = self.localCollection.index(of: addition.document)!
                let indexPath = IndexPath(row: index, section: 0)
                indexPaths.append(indexPath)
            }
            
            self.tableView.insertRows(at: indexPaths, with: .automatic)
        }
    
    }
    
    deinit {
        localCollection.stopListening()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localCollection.listen()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamMemberCell", for: indexPath) as! TeamMemberViewCell
        let user = localCollection[indexPath.row]
        cell.populate(user: user)
        return cell
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

class TeamMemberViewCell: UITableViewCell {
    @IBOutlet var UserName: UILabel!
    
    func populate(user: User){
        UserName.text = user.firstName + " " + user.lastName
    }
    
    
}
