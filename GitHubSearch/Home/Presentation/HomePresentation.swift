//
//  HomePresentation.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

class HomePresentation: BaseNode, ASTableDelegate {
    let table = ASTableNode()
    let dataSource = HomeDataSource()
    
    override init() {
        super.init()
        table.allowsSelection = false
        table.dataSource = dataSource
        table.delegate = dataSource
        
        closureSetup()
        dataSource.fetchData(for: "")
    }
    
    private func closureSetup() {
        dataSource.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: table)
    }
    
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let width = UIScreen.main.bounds.width
        
        return ASSizeRangeMake(CGSize(width: width, height: 0), CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
    }
}
