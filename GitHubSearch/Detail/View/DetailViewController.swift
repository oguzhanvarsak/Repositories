//
//  DetailViewController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit

class DetailViewController: ASDKViewController<BaseNode> {
    private var presentation: DetailPresentation!
    
    init(repository: Repository) {
        super.init(node: BaseNode())
        
        presentation = DetailPresentation(repository: repository)
        
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
