//
//  CreateAccountViewController.swift
//  loginProject
//
//  Created by Brown Magic on 5/2/15.
//  Copyright (c) 2015 codeHatcher. All rights reserved.
//

import UIKit

// protocol is an extension of the create account view controller and defines functions that can be called from the CreateAccountViewController but we will implement those functions in the LoginViewController class
protocol CreateAccountViewControllerDelegate {
  func accountCreated()
}

class CreateAccountViewController: UIViewController {

  @IBOutlet weak var chooseUsernameTextField: UITextField!
  @IBOutlet weak var choosePasswordTextField: UITextField!
  @IBOutlet weak var confirmPasswordTextField: UITextField!
  
  var delegate:CreateAccountViewControllerDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func createAccountButtonPressed(sender: UIButton) {
    if (choosePasswordTextField.text == confirmPasswordTextField.text) && (choosePasswordTextField.text != nil) {
      // ideally you would tell a user when any of these fields don't evaluate correctly
      // we will store in NSUserDefaults so that we can information persistance between sessions
      // NSUserDefaults only for basic settings, in general we should not store password here
      // get access to single instance
      NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField.text, forKey: kUsernameKey)
      NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField.text, forKey: kPasswordKey)
      // save these defaults
      NSUserDefaults.standardUserDefaults().synchronize()
      
      self.dismissViewControllerAnimated(true, completion: nil)
      delegate?.accountCreated()
    }
  }
  
  @IBAction func cancelButtonPressed(sender: UIButton) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }

}
