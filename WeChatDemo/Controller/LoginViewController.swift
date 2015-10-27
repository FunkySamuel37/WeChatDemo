//
//  LoginViewController.swift
//  WeChatDemo
//
//  Created by Samuel37 on 15/10/27.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textBackView: TextBackgroundView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
//        self.passwordTextField.secureTextEntry
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(animated: Bool) {
        self.loginBtn.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginBtnClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
}

//MARK: delegate
extension LoginViewController{
    //textfield delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.userNameTextField{
            self.userNameTextField.resignFirstResponder()
            self.passwordTextField.becomeFirstResponder()
        }else {
            self.passwordTextField.resignFirstResponder()
            self.loginBtnClick(self.loginBtn)
        }
        
        return false
    }
}
