//
//  NewCaseViewController.swift
//  perp2
//
//  Created by Yuncong Ma(Lorraine) on 10/28/17.
//  Copyright © 2017 RR. All rights reserved.
//

import UIKit

class NewCaseViewController: UIViewController {

    @IBOutlet weak var datePicker: UITextField!
    @IBOutlet weak var timePicker: UITextField!
    
    
    
//    let datePicke = UIDatePicker()
//
//    func createDatePicker(){
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: <#T##DateFormatter.Style#>, timeStyle: <#T##DateFormatter.Style#>)

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
