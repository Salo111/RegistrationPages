//
//  ViewController.swift
//  RegistrationPages
//
//  Created by salo khizanishvili on 11.01.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var UsernameSignIn: UITextField!
    @IBOutlet weak var passwordSignIn: UITextField!
    var userName: String?
    var password: String?
    var email: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SignInBtn(_ sender: Any) {
        if(UsernameSignIn.text == userName && passwordSignIn.text == password){
            let nextPage = self.storyboard?.instantiateViewController(withIdentifier: "Details_Page") as! Details_Page
            nextPage.userName = UsernameSignIn.text
            nextPage.email = email
            nextPage.modalPresentationStyle = .fullScreen
            present(nextPage, animated: true, completion: nil)
        }
        else if (UsernameSignIn.text == "" || passwordSignIn.text == "") {
            self.alert(messageText: "Please fill in all textfields")
        }
        else{
            self.alert(messageText: "incorrect credentials")
        }
    }
    
    
    func alert(messageText: String) {
        let alert = UIAlertController(title: "⚠️", message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}

