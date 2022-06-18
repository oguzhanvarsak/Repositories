//
//  TabBarController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class TabBarController: ASTabBarController, UITabBarControllerDelegate {
    let homeController = HomeViewController()
    let authController = AuthViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarSetup()
        tabBarIcons()
    }
    
    private func tabBarSetup() {
        delegate = self
        configureControllers()
        selectedIndex = 0
    }
    
    private func tabBarIcons() {
        let homeIcon = UITabBarItem(title: "", image:  UIImage(named: "homeEmpty"),
                                    selectedImage: UIImage(named: "homeFilled") )
        homeController.tabBarItem = homeIcon
        
        let profileIcon = UITabBarItem(title: "", image: UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal),
                                       selectedImage: UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal))
        authController.tabBarItem = profileIcon
    }
    
    private func configureControllers() {
        let homeNavigationController = ASDKNavigationController(rootViewController: homeController)
        let authNavigationController = ASDKNavigationController(rootViewController: authController)
        
        viewControllers = [homeNavigationController, authNavigationController]
    }
}
