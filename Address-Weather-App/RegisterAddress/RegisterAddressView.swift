//
//  RegisterAddressView.swift
//  Address-Weather-App
//
//  Created by Diego Ferreira on 24/06/22.
//

import UIKit

class RegisterAddressView: UIView {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let stackView = UIStackView()
    let zipCodeLabel = UILabel()
    let zipCodeTextField = UITextField()
    
    var zipCode: String? {
        return zipCodeTextField.text
    }
    
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
        
        // Title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.text = "Cadastrar Endereço"
        
        // Subtitle
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.textColor = .systemIndigo
        subtitleLabel.text = "Digite o CEP do endereço que deseja cadastrar"
        
        
        // ZipCode
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
        zipCodeTextField.clearButtonMode = .always
        zipCodeTextField.placeholder = "Digite o CEP do endereço"
        zipCodeTextField.delegate = self
    }
    
    func layout() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        stackView.addArrangedSubview(zipCodeLabel)
        stackView.addArrangedSubview(zipCodeTextField)
        addSubview(stackView)
        
        
        // Title and Subtitle Labels
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
        
        // ZipCode
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            
            zipCodeTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}


//MARK: - EXTENSION UITextField
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

