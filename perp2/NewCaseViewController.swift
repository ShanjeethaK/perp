//
//  NewCaseViewController.swift
//  perp2
//
//  Created by Yuncong Ma(Lorraine) on 10/28/17.
//  Copyright © 2017 RR. All rights reserved.
//

import UIKit
import GooglePlaces


class NewCaseViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var _caseName: UITextField!
    @IBOutlet weak var datePicker: UITextField!
    @IBOutlet weak var timePicker: UITextField!
    @IBOutlet weak var _Location: UITextField!
    
    
    @IBAction func pickLocation(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    //Hide keyboard when press Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    //Hide keyboard when user touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func createCase(_ sender: Any) {
        let caseName = _caseName.text
        
        //Store data locally
        UserDefaults.standard.set(caseName, forKey: "caseName")
        UserDefaults.standard.set(datePicker.text, forKey: "caseDate")
        UserDefaults.standard.set(timePicker.text, forKey: "caseTime")
        UserDefaults.standard.set(_Location.text, forKey: "caseLocation")


        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle:.medium, timeStyle:.none)
        timePicker.text = DateFormatter.localizedString(from: Date(), dateStyle:.none, timeStyle:.medium)
        self._caseName.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NewCaseViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        _Location.text = place.formattedAddress
        dismiss(animated: true, completion: nil)
    }
    
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
