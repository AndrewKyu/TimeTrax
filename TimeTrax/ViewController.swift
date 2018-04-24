//
//  ViewController.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/23/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        //stores anything from emailTextField and passwordTextField into email
        if let email = emailTextField.text, let pass = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                if let u = user{
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                }else{
                    //check for error
                }
            }
        }
    }
    
    @IBAction func goToRegisterButtonTapped(_ sender: Any) {
        //when register button is pressed, it'll go to the RegistrationViewController
        self.performSegue(withIdentifier: "goToRegister", sender: self)
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

