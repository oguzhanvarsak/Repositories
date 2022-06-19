//
//  RepositoriesFeedCell.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class RepositoriesFeedCell: BaseCellNode {
    let headerNode = HeaderNode()
    let imageNode = ImageNode()
    let descriptionNode = DescriptionNode()
    
    var repository: Repository?
    
    init(repository: Repository) {
        super.init()
        self.repository = repository
        populate(repository: repository)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var layoutArray = [ASLayoutElement]()
        
        layoutArray.append(headerNode)
        layoutArray.append(descriptionNode)
        
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 0,
                                 justifyContent: .start,
                                 alignItems: .stretch,
                                 children: layoutArray)
    }
    
    private func populate(repository: Repository) {
        headerNode.populate(repository: repository)
        imageNode.populate(repository: repository)
        descriptionNode.populate(repository: repository)
    }
}
