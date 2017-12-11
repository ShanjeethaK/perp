//
//  ResetPViewController.swift
//  perp2
//
//  Created by Yuncong Ma(Lorraine) on 10/27/17.
//  Copyright © 2017 RR. All rights reserved.
//

import UIKit

class ResetPViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var _userName: UITextField!
    @IBOutlet weak var _newPsw: UITextField!
    @IBOutlet weak var _repeatPsw: UITextField!
    
    
    @IBAction func _resetPsw(_ sender: Any) {
        let userName = _userName.text
        let newPsw = _newPsw.text
        let repeatPsw = _repeatPsw.text

        //check
        if(newPsw != repeatPsw){
            displayMessage(userMessage: "Passwords do not match. Please check.")
        }
        
        //store
        UserDefaults.standard.set(newPsw, forKey: "password")
        
        //Display reset password comfirmation
        let myAlert = UIAlertController(title:nil, message:"Congratulation! Reset is successful.",preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default){
            action in self.dismiss(animated: true, completion: nil)
            
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._userName.delegate = self
        self._newPsw.delegate = self
        self._repeatPsw.delegate = self

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
    
    
    

    func displayMessage(userMessage: String){
        let myAlert = UIAlertController(title:nil, message:userMessage,preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
}
