//
//  Factories.swift
//  Address-Weather-App
//
//  Created by Diego Ferreira on 25/06/22.
//

import UIKit

//MARK: - Labels

/// Label for Textfields
func makeLabelForTextField(withText text: String) -> UILabel {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .left
    label.textColor = .black
    label.numberOfLines = 0
    label.text = text
    
    return label
}


//MARK: - Textfields
func makeTextfield(placeholder: String) -> UITextField {
    let textfield = UITextField()
    
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.borderStyle = .roundedRect
    textfield.clearButtonMode = .always
    textfield.placeholder = placeholder
    
    return textfield
}
