//
//  ViewController.swift
//  LSP
//
//  Created by WY NG on 17/11/2019.
//  Copyright © 2019 natalie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var textField: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholderText = "Custom Text Field"
        return tf
    }()
    
    lazy var accountTextField: ImageTextField = {
        let tf = ImageTextField()
        tf.image = UIImage(named: "person")
        tf.placeholderText = "Image Text Field"
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(accountTextField)
     

        NSLayoutConstraint.activate([
            accountTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            accountTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accountTextField.heightAnchor.constraint(equalToConstant: 50),
            accountTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            accountTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
            ])

        NSLayoutConstraint.activate([
            textField.bottomAnchor.constraint(equalTo: accountTextField.topAnchor,constant: -20),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
            ])
    }
}

