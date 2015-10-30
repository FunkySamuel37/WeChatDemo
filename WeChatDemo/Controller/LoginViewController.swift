//
//  LoginViewController.swift
//  WeChatDemo
//
//  Created by Samuel37 on 15/10/27.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    @IBOutlet weak var backgroundImageV: UIImageView!
    @IBOutlet weak var rootScrollV: UIScrollView!
//    @IBOutlet weak var backgroundImageV: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var textBackView: TextBackgroundView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!

    @IBOutlet weak var loginBtnToBottom: NSLayoutConstraint!
    
    @IBOutlet weak var textBackViewWidth: NSLayoutConstraint!
    let screen:CGRect! = UIScreen.mainScreen().bounds
    var isEditing:Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginBtnToBottom.constant = self.screen.height - self.textBackView.frame.origin.y - self.textBackView.frame.height - 8 - 40
        self.textBackViewWidth.constant = self.screen.width - 60
//        self.rootScrollV.contentSize = CGSize(width: self.screen.width, height: self.screen.height + 10)
        print(self.rootScrollV.contentSize.width)
        
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
        if self.userNameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty {
            let alert = UIAlertView(title: "登录失败!", message: "账号或者密码错误", delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
            
            return
        } else {
            let trimUserName = self.userNameTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            let trimPassword = self.passwordTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
        
//        (UIApplication.sharedApplication().delegate as! AppDelegate).login()
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
    
    func textFieldDidEndEditing(textField: UITextField) {
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.loginLabel.frame.origin.y   += 50
            self.textBackView.frame.origin.y += 100
            self.loginBtn.frame.origin.y     += 100
            }) { (_) -> Void in
                self.isEditing = !self.isEditing
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.loginLabel.frame.origin.y   -= 50
            self.textBackView.frame.origin.y -= 100
            self.loginBtn.frame.origin.y     -= 100
            }) { (_) -> Void in
            self.isEditing = !self.isEditing
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offset    = scrollView.contentOffset.y / 2
        let transform = CGAffineTransformMakeTranslation(0, offset)
        
        self.backgroundImageV.transform = transform
        
        self.userNameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
}
