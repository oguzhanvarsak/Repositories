//
//  AuthController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit
import WebKit

class AuthViewController: ASDKViewController<BaseNode> {
    private var webPresentation: WebDisplay!
    private var profilePresentation: ProfilePresentation!
    
    override init() {
        super.init(node: BaseNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    private func setup() {
        let defaults = UserDefaults.standard
        let username = defaults.string(forKey: "username")
        let token = defaults.string(forKey: "accessToken")
        let avatarUrl = defaults.string(forKey: "avatarUrl")
        
        if let token = token, let username = username, let avatarUrl = avatarUrl {
            profilePresentation = ProfilePresentation()
            profilePresentation.populate(person: (username, token, avatarUrl))
            
            navigationController?.navigationBar.topItem?.title = "Authenticated As"
            
            let logoutBarButtonItem = UIBarButtonItem(title: "Logout",
                                                      style: .done,
                                                      target: self,
                                                      action: #selector(deauthenticate))
            
            self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
            
            self.node.layoutSpecBlock = { (node, constrainedSize) in
                return ASInsetLayoutSpec(insets: .zero,
                                         child: self.profilePresentation)
            }
        } else {
            webPresentation = WebDisplay()
            webPresentation.delegate = self
            
            navigationController?.navigationBar.topItem?.title = "Authenticate"
            self.navigationItem.setRightBarButton(nil, animated: true)
            
            self.node.layoutSpecBlock = { (node, constrainedSize) in
                return ASInsetLayoutSpec(insets: .zero,
                                         child: self.webPresentation)
            }
        }
    }
    
    @objc func deauthenticate() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "username")
        defaults.removeObject(forKey: "accessToken")
        WebCacheCleaner.clear()
    }
}

extension AuthViewController: WebDisplayDelegate {
    func dismiss() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
}
