//
//  HomeViewController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class HomeViewController: ASDKViewController<BaseNode> {
    private var presentation: HomePresentation!
    
    override init() {
        super.init(node: BaseNode())
        
        presentation = HomePresentation()
        presentation.delegate = self
        
        self.node.addSubnode(presentation)
        
        self.node.backgroundColor = .white
        
        self.node.layoutSpecBlock = { (node, constrainedSize) in
            return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: self.presentation)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: HomePresentationDelegate {
    func navigate(with data: Repository) {
        let controller = DetailViewController(repository: data)
        self.present(controller, animated: true)
    }
}
