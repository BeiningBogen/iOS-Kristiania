//
//  SceneDelegate.swift
//  Lecture 4
//
//  Created by Benjamin Breiby on 22/09/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // If using a storyboard, the `window` property will
        // automatically be initialized and attached to the scene.
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // MARK: - To not use storyboards:
        // 1. Remove Storyboard name entry in Info.plist under Application Scene Manifest > Scene configuration > Application Session Role -> Default Configuration
        // 2. Clear "Main Interface" in project settings. (Under Deployment Info)
        // 3. Uncomment below lines:
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//        window?.rootViewController = CustomViewController()
//        window?.makeKeyAndVisible()
    }
}

