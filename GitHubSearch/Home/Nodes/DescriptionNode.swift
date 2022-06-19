//
//  DescriptionNode.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class DescriptionNode: BaseNode {
    var repositoryDescription = ASTextNode()
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0),
                                 child: repositoryDescription)
    }
    
    func populate(repository: Repository) {
        repositoryDescription.attributedText = NSAttributedString(string: repository.description ?? "" , attributes: [NSAttributedString.Key.foregroundColor: UIColor.label])
    }
}
