//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class HomeViewController: ASDKViewController<BaseNode> {
    
    override init() {
        super.init(node: BaseNode())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

