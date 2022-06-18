//
//  BaseNode.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class BaseNode: ASDisplayNode {
    override init() {
        super.init()
        
        self.automaticallyManagesSubnodes = true
    }
}
