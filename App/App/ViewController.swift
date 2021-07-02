//
//  ViewController.swift
//  App
//
//  Created by Artem Kalugin on 01.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var singInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    
    let validLogin: String = "Admin"
    let validPassword: String = "Admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInButtonAction(_ sender: Any) {
        guard let enteredLogin = loginTextField.text,
              let enteredPassword = passwordTextField.text else {return}
        
        if enteredLogin == validLogin, enteredPassword == validPassword{
            warningLabel.text = ""
            
            guard let contactsViewController = storyboard?.instantiateViewController(withIdentifier: "ContactsViewController") as? ContactsViewController else { return }
            
            navigationController?.pushViewController(contactsViewController,  animated: true)
        } else{
            warningLabel.textColor = .systemRed
            warningLabel.text = "Wrong number or password"
        }
    }
    
}

