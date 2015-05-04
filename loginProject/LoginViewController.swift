//
//  LoginViewController.swift
//  loginProject
//
//  Created by Brown Magic on 5/2/15.
//  Copyright (c) 2015 codeHatcher. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, CreateAccountViewControllerDelegate {

  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  // we need to set delegate property in the CreateAccountViewController Delgate
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "loginToCreateAccountSegue" {
      var createAccountVC = segue.destinationViewController as CreateAccountViewController
      createAccountVC.delegate = self
    }
    
  }

  @IBAction func loginButtonPressed(sender: UIButton) {
    // check that the login information matches the previously created account
    // get the information from the NSUserDefaults
    let usernameSavedFromNSUserDefaults:String = NSUserDefaults.standardUserDefaults().objectForKey(kUsernameKey) as String
    let passwordSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPasswordKey) as String
    println(usernameSavedFromNSUserDefaults)
    println(passwordSavedFromNSUserDefaults)
    
    if usernameTextField.text == usernameSavedFromNSUserDefaults && passwordTextField.text == passwordSavedFromNSUserDefaults {
      // username and password matches, go ahead and segue
      self.performSegueWithIdentifier("loginToMainSegue", sender: nil)
    }
  }
  
  @IBAction func createAccountButtonPressed(sender: UIButton) {
    self.performSegueWithIdentifier("loginToCreateAccountSegue", sender: self)
  }
  
  // CreateAccountViewControllerDelegate
  // when account is created, skip this screen and skip to main screen there are other ways to do it but this is in order to use the protocol
  func accountCreated() {
    self.performSegueWithIdentifier("loginToMainSegue", sender: nil)
  }
  

}
