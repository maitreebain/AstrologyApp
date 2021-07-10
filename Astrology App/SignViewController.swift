//
//  ViewController.swift
//  Astrology App
//
//  Created by Maitree Bain on 7/5/21.
//

import UIKit

class SignViewController: UIViewController {
    
    @IBOutlet var costarLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var signPicker: UIPickerView!
    @IBOutlet var submitButton: UIButton!
    
    let signs = Zodiacs.allCases
    var name: String?
    var zodiacSign: String?
    var user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        signPicker.delegate = self
    }

    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        //segue to next view
        user = UserModel(name: name ?? "Anon", sign: zodiacSign ?? "no Sign")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        guard let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            //show alert?
            print("cannot go to another view controller")
            return
        }
        detailViewController.user = user
        self.present(detailViewController, animated:true, completion:nil)
    }
    
    
}

extension SignViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        name = textField.text
    }
    
}

extension SignViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return signs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return signs[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let sign = signs[row].rawValue
        zodiacSign = sign
            //currently this looks like "date - sign", when i require "sign"
    }
}

