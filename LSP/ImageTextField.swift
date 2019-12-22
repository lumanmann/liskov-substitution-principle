//
//  ImageTextField.swift
//  LSP
//
//  Created by WY NG on 17/11/2019.
//  Copyright © 2019 natalie. All rights reserved.
//

import UIKit


class ImageTextField: CustomTextField {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    
    override func setupSubviews() {
        addSubview(inputTF)
        addSubview(clearButton)
        addSubview(imageView)
        
        
        setImageViewLayout()
        setInputTFLayput()
        setClearButtonLayout()
    }
    
    func setImageViewLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalTo: self.heightAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor)
            ])
        
        
    }
    
    override func setInputTFLayput() {
        NSLayoutConstraint.activate([
            inputTF.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            inputTF.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            inputTF.leftAnchor.constraint(equalTo: imageView.rightAnchor),
            inputTF.rightAnchor.constraint(equalTo: clearButton.leftAnchor)
            ])
    }
    
    
}
