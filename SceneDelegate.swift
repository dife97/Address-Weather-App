//
//  SceneDelegate.swift
//  Address-Weather-App
//
//  Created by Diego Ferreira on 20/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let viewController = RegisterAddressViewController()

        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
}

