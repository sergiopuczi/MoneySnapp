//
//  ViewController.swift
//  MoneySnapp
//
//  Created by Sergio Puczi on 07/09/18.
//  Copyright © 2018 Sergio Puczi. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signinButton(_ sender: UIButton) {
        print("SignIn button pressed!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        // Used to move textfield when keyboard appears
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        // Set email and password placeholder's colour to white
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        // Hide keyboard when pressing anywhere
        self.hideKeyboardWhenTappedAround()
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    ///////////////////////////////////////////
    
    //MARK: - Hide Keyboard Methods
    
    
    // Hide keyboard when touching anywhere
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    ///////////////////////////////////////////
    
    //MARK: - Return Key Methods (Switch Between TextFields)
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    
    
    ///////////////////////////////////////////
    
    //MARK: - Move TextField When Keyboard Appears
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }

}






