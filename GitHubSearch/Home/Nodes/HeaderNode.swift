//
//  HeaderNode.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class HeaderNode: BaseNode {
    var profileImage = ASNetworkImageNode()
    var repositoryName = ASTextNode()
    var starImage = ASImageNode()
    var repositoryStars = ASTextNode()
    var languageImage = ASImageNode()
    var repositoryLanguage = ASTextNode()
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let iconSpec = ASStackLayoutSpec(direction: .horizontal,
                                         spacing: 10,
                                         justifyContent: .start,
                                         alignItems: .center,
                                         children: [profileImage, repositoryName])
        
        let infoSpec = ASStackLayoutSpec(direction: .horizontal,
                                         spacing: 5,
                                         justifyContent: .end,
                                         alignItems: .end,
                                         children: [starImage, repositoryStars, languageImage, repositoryLanguage])
        
        let leftPadding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0),
                                            child: iconSpec)
        
        let rightPadding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16),
                                             child: infoSpec)
        
        rightPadding.style.flexGrow = 1
        
        let finalSpec = ASStackLayoutSpec(direction: .horizontal,
                                          spacing: 10,
                                          justifyContent: .end,
                                          alignItems: .center,
                                          children: [leftPadding, rightPadding])
        return finalSpec
    }
    
    private func setup() {
        profileImage.backgroundColor = .green
        profileImage.cornerRadius = 35/2
        profileImage.style.preferredSize = CGSize(width: 35, height: 35)
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 10, weight: .bold, scale: .large)
        starImage.image = UIImage(systemName: "star", withConfiguration: largeConfig)
        languageImage.image = UIImage(systemName: "globe", withConfiguration: largeConfig)
    }
    
    func populate(repository: Repository) {
        profileImage.url = URL(string: repository.owner?.avatarUrl ?? "")
        
        repositoryName.attributedText = NSAttributedString(string: repository.name ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label])
        repositoryStars.attributedText = NSAttributedString(string: "\(repository.watchers ?? 0)")
        repositoryLanguage.attributedText = NSAttributedString(string: repository.language ?? "")
    }
}
