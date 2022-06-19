//
//  SceneDelegate.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        
        let viewController = HomeViewController()
        let navigationController = ASDKNavigationController(rootViewController: viewController)
        navigationController.navigationBar.topItem?.title = "Repositories"
        navigationController.navigationBar.prefersLargeTitles = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

