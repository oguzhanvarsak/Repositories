//
//  ReadMeNode.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit
import MarkdownView

class ReadMeNode: ASDisplayNode {
    init(readMe: String) {
        super.init()
        
        self.setViewBlock({
            let md = MarkdownView()
            md.load(markdown: readMe)
            return md
        })
        
        self.style.height = .init(unit: .points, value: UIScreen.height - 220)
    }
}
