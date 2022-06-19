//
//  DetailPresentation.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit

class DetailPresentation: BaseNode {
    let table = ASTableNode()
    
    var viewModel: DetailViewModel!
    
    init(repository: Repository) {
        super.init()
        
        viewModel = DetailViewModel(repository: repository)
        viewModel.fetchData()
        viewModel.delegate = self
        
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
                                 child: table)
    }
}

extension DetailPresentation: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRangeMake(CGSize(width: UIScreen.width, height: 0),
                               CGSize(width: UIScreen.width, height: CGFloat.greatestFiniteMagnitude))
    }
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 3
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        switch indexPath.section {
            case 0:
                let cell = RepositoriesFeedCell(repository: viewModel.repository)
                return cell
            case 1:
                let cell = DetailCell(repository: viewModel.repository)
                return cell
            default:
                let cell = ReadMeCell(readMe: viewModel.readMe ?? "")
                return cell
        }
    }
}

extension DetailPresentation: DetailViewModelDelegate {
    func reloadMarkdown(with data: String) {
        DispatchQueue.main.async {
            self.table.reloadRows(at: [IndexPath(row: 0, section: 2)], with: .none)
        }
    }
}
