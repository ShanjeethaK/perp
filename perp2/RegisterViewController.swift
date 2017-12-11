//
//  RegisterPageViewController.swift
//  perp2
//
//  Created by Yuncong Ma(Lorraine) on 10/25/17.
//  Copyright © 2017 RR. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var _firstName: UITextField!
    @IBOutlet weak var _lastName: UITextField!
    @IBOutlet weak var _badgeNum: UITextField!
    @IBOutlet weak var _userEmail: UITextField!
    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var _password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self._firstName.delegate = self
        self._lastName.delegate = self
        self._badgeNum.delegate = self
        self._username.delegate = self
        self._userEmail.delegate = self
        self._password.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hide keyboard when user touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    //Hide keyboard when press Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let firstName = _firstName.text
        let lastName = _lastName.text
        let badgeNumber = _badgeNum.text
        let userEmail = _userEmail.text
        let userName = _username.text
        let password = _password.text
        
        //check for empty fields
        if(userName == "" || password == "" )
        {
            //Display alert message
            displayAlertMessage(userMessage: "Please enter a Username and Password to continue.")
            return;
        }
        
        //Store data locally
        UserDefaults.standard.set(firstName, forKey: "firstName")
        UserDefaults.standard.set(lastName, forKey: "lastName")
        UserDefaults.standard.set(badgeNumber, forKey: "badgeNumber")
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
        linkToDB()
        
        
        //Display alert message with comfirmation
        let myAlert = UIAlertController(title:nil, message:"Congratulation! Registration is successful.",preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default){
            action in self.dismiss(animated: true, completion: nil)

        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
        
    }
    
    func linkToDB(){
        //Store data into database
    }
    
    func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title:nil, message:userMessage,preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler:nil)
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


