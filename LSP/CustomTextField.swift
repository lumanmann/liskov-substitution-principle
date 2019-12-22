//
//  CustomTextField.swift
//  LSP
//
//  Created by WY NG on 17/11/2019.
//  Copyright © 2019 natalie. All rights reserved.
//

import UIKit

class CustomTextField: UIView {
    
    var isEditing: Bool = false {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.clearButton.isHidden = !self.isEditing
                self.layer.borderColor = self.isEditing ? UIColor.orange.cgColor : UIColor.lightGray.cgColor
            
            }
        }
    }

    var isEnabled: Bool = true {
        didSet {
            inputTF.isEnabled = isEnabled
        }
    }
    
    var placeholderText: String? {
        didSet {
            resetPlaceholer()
        }
    }
    
    var text: String? {
        return inputTF.text
    }
    

    
    lazy var clearButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "clear"), for: .normal)
        btn.addTarget(self, action: #selector(clearClicked), for: .touchUpInside)
        return btn
    }()
    
    lazy var inputTF: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .center
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        return tf
    }()
    
  
    convenience init() {
        self.init(frame: .zero)
        inputTF.delegate = self
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func becomeFirstResponder() -> Bool {
        inputTF.becomeFirstResponder()
        return true
    }

    @objc func dismissKeyboard() {
        inputTF.resignFirstResponder()
    }
    
    
    @objc func clearClicked() {
        inputTF.text = nil
    }
    
    private func setupView() {
        layer.borderWidth = 2
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = .white
        resetPlaceholer()
        setupSubviews()
        
        isEditing = false
        
    }
    
    func resetPlaceholer() {
        inputTF.placeholder = placeholderText
    }
    
    
    func didEdited() {
        isEditing = false
    }
    
    
    func setupSubviews() {
        addSubview(inputTF)
        addSubview(clearButton)
        setInputTFLayput()
        setClearButtonLayout()
    }
    
    func setInputTFLayput() {
        NSLayoutConstraint.activate([
            inputTF.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            inputTF.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            inputTF.leftAnchor.constraint(equalTo: self.leftAnchor),
            inputTF.rightAnchor.constraint(equalTo: clearButton.leftAnchor)
            ])
    }
    
    func setClearButtonLayout() {
        NSLayoutConstraint.activate([
            clearButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            clearButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            clearButton.widthAnchor.constraint(equalTo: clearButton.heightAnchor),
            clearButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
            ])
    }
    
 
    func endEditing() {
        inputTF.endEditing(true)
    }
    
}


extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        isEditing = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        didEdited()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTF.endEditing(true)
        return true
    }
    
}

