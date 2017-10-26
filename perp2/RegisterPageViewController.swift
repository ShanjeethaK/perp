//
//  RegisterPageViewController.swift
//  perp2
//
//  Created by Yuncong Ma(Lorraine) on 10/25/17.
//  Copyright © 2017 RR. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var _firstName: UITextField!
    @IBOutlet weak var _lastName: UITextField!
    @IBOutlet weak var _badgeNum: UITextField!
    @IBOutlet weak var _userEmail: UITextField!
    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var _mobileNum: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        var firstName = _firstName.text;
        var lastName = _lastName.text
        var badgeNumber = _badgeNum.text
        var userEmail = _userEmail.text
        var userName = _username.text
        var mobileNum = _mobileNum.text
        
        //check for empty fields
        if(userName == "" || mobileNum == "" || firstName=="" || mobileNum=="")&&(badgeNumber=="" || userEmail=="")
        {
            //Display alert message
            displayAlertMessage(userMessage: "All fields are required")
            return;
        }
        
        //Store data locally
        UserDefaults.standard.set(firstName, forKey: "firstName")
        UserDefaults.standard.set(lastName, forKey: "lastName")
        UserDefaults.standard.set(badgeNumber, forKey: "badgeNumber")
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(mobileNum, forKey: "mobileNum")
        UserDefaults.standard.synchronize()
        
        //Display alert message with comfirmation
        let myAlert = UIAlertController(title:"Alert", message:"Registration is successful",preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){
            action in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
        
    }
    
    func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title:"Alert", message:userMessage,preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
        
        
}
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


