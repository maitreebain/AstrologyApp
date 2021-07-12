//
//  ViewController.swift
//  Astrology App
//
//  Created by Maitree Bain on 7/5/21.
//

import UIKit

class SignViewController: UIViewController {
    
    @IBOutlet var astrologeLabel: UILabel!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var sunsignLabel: UILabel!
    @IBOutlet var signPicker: UIPickerView!
    @IBOutlet var submitButton: UIButton!
    
    let signs = [Zodiac.aries.rawValue, Zodiac.taurus.rawValue, Zodiac.gemini.rawValue, Zodiac.cancer.rawValue, Zodiac.leo.rawValue, Zodiac.virgo.rawValue, Zodiac.libra.rawValue, Zodiac.scorpio.rawValue, Zodiac.sagittarius.rawValue, Zodiac.capricorn.rawValue, Zodiac.aquarius.rawValue, Zodiac.pisces.rawValue]
    
    var selectedSign = Zodiac.aries.rawValue
    var name: String?
    var user: UserModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIupdates()
        nameTextField.delegate = self
        signPicker.delegate = self
    }
    
    func UIupdates() {
        astrologeLabel.layer.masksToBounds = true
        welcomeLabel.layer.masksToBounds = true
        nameTextField.layer.masksToBounds = true
        sunsignLabel.layer.masksToBounds = true
        signPicker.layer.masksToBounds = true
        submitButton.layer.masksToBounds = true
        astrologeLabel.layer.cornerRadius = 8
        welcomeLabel.layer.cornerRadius = 4
        nameTextField.layer.cornerRadius = 8
        sunsignLabel.layer.cornerRadius = 4
        signPicker.layer.cornerRadius = 8
        submitButton.layer.cornerRadius = 8
    }

    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        //segue to next view
        user = UserModel(name: name ?? "Anon", sign: selectedSign)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        guard let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            //show alert?
            print("cannot go to another view controller")
            return
        }
        detailViewController.user = user
        self.present(UINavigationController(rootViewController: detailViewController), animated:true, completion:nil)
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
        return signs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let sign = signs[row]
        selectedSign = sign
    }
}

