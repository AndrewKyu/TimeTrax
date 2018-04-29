//
//  RegistrationViewController.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/23/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var rpassword_textField: UIScrollView!
    @IBOutlet weak var password_textField: UIScrollView!
    @IBOutlet weak var name_textField: UIScrollView!
    @IBOutlet weak var Log_in_box: UIView!
    @IBOutlet weak var email_textField: UIScrollView!
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
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
            weak var pvc = self.presentingViewController
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                self.dismiss(animated: false, completion: {
                    pvc?.performSegue(withIdentifier: "goToHome", sender: nil)
                })

            }
        }else{
            //Error: check error and show message
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "le-clock.jpg")!)
        Log_in_box.layer.shadowOpacity = 0.7
        Log_in_box.layer.shadowOffset = CGSize(width: 3, height: 3)
        Log_in_box.layer.shadowRadius = 15.0
        Log_in_box.layer.shadowColor = UIColor.darkGray.cgColor

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
