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

    private let userName = "user"
    private let password = "123"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeMessage = userName
    }

    @IBAction func loginTaped() {
        guard userNameTF.text == userName && passwordTF.text == password else {
            alertWindow(
                with: "Invalid username or password",
                and: "Please, enter correct username or password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "Welcome", sender: nil)
    }

    @IBAction func forgotUserNameTaped() {
        alertWindow(with: "Oops!", and: "Your name is \(userName) 😉")
    }
    
    @IBAction func forgotPasswordTaped() {
        alertWindow(with: "Oops!", and: "Your password is \(password) 😉")
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController {

    private func alertWindow(with title: String, and text: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {_ in
            textField?.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true )
    }
}

extension LoginViewController: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginTaped()
        }
        return true
    }
}
