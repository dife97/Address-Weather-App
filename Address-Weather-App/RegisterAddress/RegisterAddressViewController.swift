//
//  ViewController.swift
//  Address-Weather-App
//
//  Created by Diego Ferreira on 20/06/22.
//

import UIKit

class RegisterAddressViewController: UIViewController {

    let registerAddressView = RegisterAddressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        style()
        layout()
    }
}

extension RegisterAddressViewController {
    private func style() {
        registerAddressView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(registerAddressView)
        
        NSLayoutConstraint.activate([
            registerAddressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registerAddressView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: registerAddressView.trailingAnchor, multiplier: 2),
        ])
    }
}
