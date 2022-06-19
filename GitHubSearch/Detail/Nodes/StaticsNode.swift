//
//  StaticsNode.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit

class StaticsNode: ASScrollNode {
    var watchers = ASTextNode()
    var issues = ASTextNode()
    var forks = ASTextNode()
    var topic = ASTextNode()
    var licence = ASTextNode()
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let labelStack = ASStackLayoutSpec(direction: .horizontal,
                                       spacing: 10,
                                       justifyContent: .end,
                                       alignItems: .center,
                                       children: [watchers, issues, forks, topic, licence])
        
        let finalSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16), child: labelStack)
        
        return finalSpec
    }
    
    private func setup() {
        automaticallyManagesSubnodes = true
        automaticallyManagesContentSize = true
        scrollableDirections = [.left, .right]
    }
    
    func populate(repository: Repository) {
        watchers.attributedText = NSAttributedString(string: "Watchers: \(repository.watchers ?? 0)")
        issues.attributedText = NSAttributedString(string: "Issues: \(repository.openIssues ?? 0)")
        forks.attributedText = NSAttributedString(string: "Forks: \(repository.forks ?? 0)")
        licence.attributedText = NSAttributedString(string: "Licence: \(repository.license?.name ?? "")")
        
        if let topics = repository.topics, !topics.isEmpty {
            let string = NSMutableAttributedString(string: "Topics:")
            for topic in topics {
                string.append(NSAttributedString(string: " [\(topic)]"))
            }
            
            topic.attributedText = string
        }
    }
}
