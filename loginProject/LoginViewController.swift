//
//  LoginViewController.swift
//  loginProject
//
//  Created by Brown Magic on 5/2/15.
//  Copyright (c) 2015 codeHatcher. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

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
    

  @IBAction func loginButtonPressed(sender: UIButton) {
    self.performSegueWithIdentifier("loginToMainSegue", sender: self)
  }
  
  @IBAction func createAccountButtonPressed(sender: UIButton) {
    self.performSegueWithIdentifier("loginToCreateAccountSegue", sender: self)
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
