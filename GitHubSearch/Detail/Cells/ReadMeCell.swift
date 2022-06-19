//
//  ReadMeCell.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit

class ReadMeCell: BaseCellNode {
    var readMeNode: ReadMeNode?
    
    init(readMe: String) {
        super.init()
        readMeNode = ReadMeNode(readMe: readMe)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var layoutArray = [ASLayoutElement]()
        
        layoutArray.append(readMeNode!)
        
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 0,
                                 justifyContent: .start,
                                 alignItems: .stretch,
                                 children: layoutArray)
    }
}
