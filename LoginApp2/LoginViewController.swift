    //
    //  ViewController.swift
    //  LoginApp2
    //
    //  Created by Konstantin Fomenkov on 01.05.2023.
    //

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!

    let userName = "user"
    let password = "123"
    

    @IBAction func loginTaped() {
        guard userNameTF.text == userName && passwordTF.text == password else {
            alertWindow(
                with: "Invalid username or password",
                and: "Please, enter correct username or password")
            return
        }
    }

    @IBAction func forgotUserNameTaped() {
        alertWindow(with: "Oops!", and: "Your name is user 😉")
    }
    
    @IBAction func forgotPasswordTaped() {
        alertWindow(with: "Oops!", and: "Your password is 123 😉")
    }
}

extension LoginViewController {

    private func alertWindow(with title: String, and text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
        passwordTF.text = ""
    }
}
