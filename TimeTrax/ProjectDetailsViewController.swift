//
//  ProjectDetailsViewController.swift
//  TimeTrax
//
//  Created by Bryan Cole on 4/28/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import FirebaseAuthUI

class ProjectDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    

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
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
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
//    @IBOutlet var UserName: UILabel!
    
    func populate(user: User){
//        UserName.text = user.firstName + " " + user.lastName
    }
    
    
}
