//
//  LoginViewController.swift
//  perp2
//
//  Created by Yuncong Ma (Lorraine) on 10/28/17.
//  Copyright © 2017 RR. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var _psw: UITextField!
    
    @IBAction func _loginButton(_ sender: Any) {
        let userN = _username.text
        let psw = _psw.text
        
        if (userN == "" || psw == "")
        {
            //Display alert message
            displayAlertMessage(userMessage: "All fields are required")
            return
        }
        
        //Read store information locally
        let userNStored = UserDefaults.standard.string(forKey: "userName")
        let pswStored = UserDefaults.standard.string(forKey: "mobileNum")
        
        if (userNStored==userN)&&(pswStored==psw){
            
            //login is successful
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize();
            self.performSegue(withIdentifier: "afterLogin", sender: self)

            }
        
    }

    
    func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title:"Alert", message:userMessage,preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
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
