//
//  HomeViewController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class HomeViewController: ASDKViewController<BaseNode> {
    var repoFeed: HomePresentation!
    
    override init() {
        super.init(node: BaseNode())
        repoFeed = HomePresentation()
        self.node.addSubnode(repoFeed)
        
        self.node.backgroundColor = .white
        
        self.node.layoutSpecBlock = { (node, constrainedSize) in
            return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: self.repoFeed)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
