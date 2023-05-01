//
//  WelcomeViewController.swift
//  LoginApp2
//
//  Created by Konstantin Fomenkov on 01.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!

    var welcomeMessage: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setWindowGradient()
        welcomeLabel.text = "Welcome, \(welcomeMessage ?? "")!"
    }

    private func setWindowGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
