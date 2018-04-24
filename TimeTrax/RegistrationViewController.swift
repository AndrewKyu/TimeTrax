//
//  RegistrationViewController.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/23/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToLogin", sender: self)
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text{
//            let alert = UIAlertController(title: "Error", message: "You did not fill out all fields", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
//
//            if email == nil{
//                self.present(alert, animated: true)
//            }
            
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                self.performSegue(withIdentifier: "goToHome", sender: self)
            }
        }else{
            //Error: check error and show message
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
