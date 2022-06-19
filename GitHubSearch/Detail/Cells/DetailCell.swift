//
//  DetailCell.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit

class DetailCell: BaseCellNode {
    let staticsNode = StaticsNode()
    
    var repository: Repository?
    
    init(repository: Repository) {
        super.init()
        self.repository = repository
        populate(repository: repository)
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var layoutArray = [ASLayoutElement]()
        
        layoutArray.append(staticsNode)
        
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 0,
                                 justifyContent: .start,
                                 alignItems: .stretch,
                                 children: layoutArray)
    }
    
    private func populate(repository: Repository) {
        staticsNode.populate(repository: repository)
    }
}
