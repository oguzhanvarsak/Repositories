//
//  AuthController.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class AuthViewController: ASDKViewController<BaseNode> {
    override init() {
        super.init(node: BaseNode())
        backgroundColour()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        backgroundColour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func backgroundColour() {
        self.node.backgroundColor = .systemBackground
    }
}
