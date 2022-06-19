//
//  BaseViewController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit

class BaseViewController: ASDKViewController<BaseNode> {
    override init() {
        super.init(node: BaseNode())
        self.node.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
