//
//  HomeViewController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class HomeViewController: BaseViewController {
    private var presentation: HomePresentation!
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        presentation = HomePresentation()
        presentation.delegate = self
        
        let authenticateBarButton = UIBarButtonItem(title: "Authenticate", style: .done,
                                                    target: self,
                                                    action: #selector(presentAuthScreen))
        
        self.navigationItem.rightBarButtonItem  = authenticateBarButton
        
        self.node.addSubnode(presentation)
        
        self.node.layoutSpecBlock = { (node, constrainedSize) in
            return ASInsetLayoutSpec(insets: .zero,
                                     child: self.presentation)
        }
    }
    
    @objc func presentAuthScreen() {
        let controller = AuthViewController()
        let navController = UINavigationController(rootViewController: controller)
        self.present(navController, animated: true)
    }
}

extension HomeViewController: HomePresentationDelegate {
    func navigate(with data: Repository) {
        let controller = DetailViewController(repository: data)
        self.present(controller, animated: true)
    }
    
    func presentAlert(describing error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in
                self.dismiss(animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
