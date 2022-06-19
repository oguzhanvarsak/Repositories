//
//  ProfilePresentation.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit

class ProfilePresentation: BaseNode {
    var avatar = ASNetworkImageNode()
    var username = ASTextNode()
    var token = ASTextNode()
    
    override init() {
        super.init()
        
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical,
                                      spacing: 10,
                                      justifyContent: .center,
                                      alignItems: .center,
                                      children: [avatar, username, token])
        
        return stack
    }
    
    private func setup() {
        self.backgroundColor = .white
        
        avatar.backgroundColor = .green
        avatar.cornerRadius = 100/2
        avatar.style.preferredSize = CGSize(width: 100, height: 100)
    }
    
    func populate(person: (username: String, token: String, avatarUrl: String)) {
        avatar.url = URL(string: person.avatarUrl)
        username.attributedText = NSAttributedString(string: person.username)
        token.attributedText = NSAttributedString(string: person.token)
    }
}
