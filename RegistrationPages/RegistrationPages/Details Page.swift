//
//  Details Page.swift
//  RegistrationPages
//
//  Created by salo khizanishvili on 11.01.23.
//

import UIKit

class Details_Page: UIViewController {

    @IBOutlet weak var UsernameDetails: UILabel!
    @IBOutlet weak var emailDetails: UILabel!
    var userName: String?
    var email: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(userName != nil && email != nil){
            UsernameDetails.text = userName
            emailDetails.text = email
        }
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
}
