//
//  ViewController.swift
//  PasswordValidation
//
//  Created by Akshara Vangala on 14/07/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
   var enterPress = false
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.backgroundColor = .secondarySystemFill
        self.enterPassword.delegate = self
       self.confirmPassword.delegate = self
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.enterPassword.resignFirstResponder()
        self.confirmPassword.resignFirstResponder()
        //performAction()
        return true
    }
    @IBAction func textFieldDidBeginEditing(_ textField: UITextField) {
        if enterPassword.text == "" {
            b1 = passwordConstraintFailed(b1)
            b2 = passwordConstraintFailed(b2)
            b3 = passwordConstraintFailed(b3)
            b4 = passwordConstraintFailed(b4)
            b5 = passwordConstraintFailed(b5)
        }
        passwordValidation(textField.text!)
    }
  
    func passwordValidation(_ password: String) {
        var lowerCaseLetter: Bool = false
        var upperCaseLetter: Bool = false
        var digit: Bool = false
        var specialCharacter: Bool = false
        
            for char in password.unicodeScalars {
                if !lowerCaseLetter {
                    lowerCaseLetter = CharacterSet.lowercaseLetters.contains(char)
                    b3 = lowerCaseLetter ? passwordConstraintSatisfied(b3) : passwordConstraintFailed(b3)
                }
                if !upperCaseLetter {
                    upperCaseLetter = CharacterSet.uppercaseLetters.contains(char)
                    b2 = upperCaseLetter ? passwordConstraintSatisfied(b2) : passwordConstraintFailed(b2)
                }
                if !digit {
                    digit = CharacterSet.decimalDigits.contains(char)
                    b5 = digit ? passwordConstraintSatisfied(b5) : passwordConstraintFailed(b5)
                }
                if !specialCharacter {
                    specialCharacter = CharacterSet.punctuationCharacters.contains(char)
                    b4 = specialCharacter ? passwordConstraintSatisfied(b4) : passwordConstraintFailed(b4)
                }
                
                    b1 = password.count >= 8 ? passwordConstraintSatisfied(b1) : passwordConstraintFailed(b1)
                
            }
    }
    
    func passwordConstraintSatisfied(_ btn: UIButton) -> UIButton{
        let image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 7, weight: .bold))?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        btn.setImage(image, for: .normal)
        return btn
    }
    func passwordConstraintFailed(_ btn: UIButton) -> UIButton{
        let image = UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 7, weight: .bold))?.withTintColor(.tertiarySystemFill, renderingMode: .alwaysOriginal)
        btn.setImage(image, for: .normal)
        return btn
    }
    
}
//func performAction(){
//
//    var isValidPassword = false
//        confirmPassword.isUserInteractionEnabled = false
//        isValidPassword = passwordValidation(enterPassword.text!)
//        print(isValidPassword)
//
//        if isValidPassword {
//            self.confirmPassword.becomeFirstResponder()
//            confirmPassword.isUserInteractionEnabled = true
//        }
//        if enterPassword.text == confirmPassword.text {
//            confirmButton.isEnabled = true
//            confirmButton.backgroundColor = .systemGreen
//        }
//}
//
//@IBAction func didConfirmButtonGetPress(_ sender: UIButton) {
//    let alert = UIAlertController(title: "Password Set", message: "", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
//            print("Action")
//        }))
//        self.present(alert, animated: true, completion: nil)
//}
