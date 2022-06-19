//
//  ImageNode.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class ImageNode: BaseNode {
    var repositoryImage = ASNetworkImageNode()
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
                                 child: repositoryImage)
    }
    
    private func setup() {
        repositoryImage.style.preferredSize = CGSize(width: 35, height: 100)
        
        repositoryImage.url = URL(string: "https://texturegroup.org/static/images/logo.svg")
        repositoryImage.contentMode = .scaleAspectFit
    }
    
    func populate(repository: Repository) {
        
    }
}
