//
//  RegistrationPage.swift
//  RegistrationPages
//
//  Created by salo khizanishvili on 11.01.23.
//

import UIKit

class RegistrationPage: UIViewController {
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    
    var pass: String?
    var confirmPass: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(pass != nil && confirmPass != nil){
            passwordTxtField.text = pass
            confirmPasswordTxtField.text = confirmPass
        }
    }
    
    @IBAction func SignUpBtn(_ sender: Any) {
        if (usernameTxtField.text == "" || emailTxtField.text == "" || passwordTxtField.text == "" || confirmPasswordTxtField.text == "") {
            self.alert(messageText: "Please fill in all textfields")
        }
        let str = passwordTxtField.text!
        var res = ""
        let characters = CharacterSet.decimalDigits
        let range = str.rangeOfCharacter(from: characters)
        if range != nil {
            res = "we have int in password"
        }
        let uppercasedPass = str.uppercased()
        let res2 = (str + uppercasedPass).count - Set(uppercasedPass + str).count
        if(str.count < 8 || res != "we have int in password" ||
           res2 == 0){
            self.alert(messageText: "This password is not secure")
        }
        if(passwordTxtField.text != confirmPasswordTxtField.text){
            self.alert(messageText: "passwords doesn't match")
        }
        
        else{
        let controller = storyboard?.instantiateViewController(identifier: "ViewController")as!ViewController
        controller.password = passwordTxtField.text
        controller.userName = usernameTxtField.text
        controller.email = emailTxtField.text
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)

        }
    }
    
    func alert(messageText: String) {
        let alert = UIAlertController(title: "⚠️", message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}
