//
//  RegisterAddressView.swift
//  Address-Weather-App
//
//  Created by Diego Ferreira on 24/06/22.
//

import UIKit

class RegisterAddressView: UIView {
    
    let stackView = UIStackView()
    let zipCodeLabel = UILabel()
    let zipCodeTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterAddressView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        zipCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        zipCodeLabel.textAlignment = .left
        zipCodeLabel.textColor = .black
        zipCodeLabel.text = "CEP*"
        
        zipCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        zipCodeTextField.borderStyle = .roundedRect
        zipCodeTextField.keyboardType = .numberPad
        zipCodeTextField.placeholder = "Digite o CEP do endereço"
        zipCodeTextField.delegate = self
    }
    
    func layout() {
        stackView.addArrangedSubview(zipCodeLabel)
        stackView.addArrangedSubview(zipCodeTextField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        
        zipCodeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}


//MARK: - UITextFieldDelegate
extension RegisterAddressView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 0
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.systemIndigo.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 5
        
        if textField.keyboardType.rawValue == 4 {
            textField.addDoneCancelToolbar()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}


extension UITextField {
    
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
    @objc func doneButtonTapped() { self.resignFirstResponder() }
}

