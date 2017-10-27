//
//  ViewController.swift
//  perp2
//
//  Created by Shanjee Kirupananthan on 10/7/17.
//  Copyright © 2017 RR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
            //UserDefaults.standard.string(forKey: "userName")
        
        let pswStored = UserDefaults.standard.string(forKey: "mobileNum")
       
        if (userNStored==userN)&&(pswStored==psw){
            
            //login is successful
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize();
            self.dismiss(animated: true, completion: nil)
            
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

