//
//  TextfieldView.swift
//  Address-Weather-App
//
//  Created by Diego Ferreira on 25/06/22.
//

import UIKit

class TextfieldView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 70)
    }
    
    private func setupViews() {
        let zipCodeLabel = makeLabelForTextField(withText: "CEP*")
        let zipCodeTextField = makeTextfield(placeholder: "Digite o CEP do endereço")
        
        addSubview(zipCodeLabel)
        addSubview(zipCodeTextField)
        
        zipCodeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        zipCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        zipCodeTextField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        zipCodeTextField.centerYAnchor.constraint(equalTo: zipCodeLabel.centerYAnchor).isActive = true
        
    }
}
