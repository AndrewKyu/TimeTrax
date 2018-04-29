//
//  ViewController.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/23/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var Password_textField: UITextField!
    @IBOutlet weak var email_textField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var Log_in_box: UIView!
    
    @IBAction func loginButtonPressed(_ sender: Any) {

        //stores anything from emailTextField and passwordTextField into email
        if let email = emailTextField.text, let pass = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                if let u = user{
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                }else{
                    let alertController = UIAlertController(title: "Login Failed", message: "Incorrect Email or Password", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "le-clock.jpg")!)
        self.setNeedsStatusBarAppearanceUpdate()
        Log_in_box.layer.shadowOpacity = 0.7
        Log_in_box.layer.shadowOffset = CGSize(width: 3, height: 3)
        Log_in_box.layer.shadowRadius = 15.0
        Log_in_box.layer.shadowColor = UIColor.darkGray.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let y_offset = Log_in_box.layer.position.y/2.3
        scrollView.setContentOffset(CGPoint(x:0.0,y: y_offset), animated: true)
        print("started editing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x:0.0,y:0.0), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}


