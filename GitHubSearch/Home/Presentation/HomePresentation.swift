//
//  HomePresentation.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit

protocol HomePresentationDelegate: NSObject {
    func navigate(with data: Repository)
}

class HomePresentation: BaseNode {
    let table = ASTableNode()
    let searchNode = SearchNode()
    
    var viewModel: HomeViewModel!
    weak var delegate: HomePresentationDelegate?
    
    var isLoadingMore = false
    
    override init() {
        super.init()
        
        viewModel = HomeViewModel()
        viewModel.delegate = self
        
        table.dataSource = self
        table.delegate = self
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: table)
    }
}

// MARK: - TableView Delegate & Data Source
extension HomePresentation: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let width = UIScreen.main.bounds.width
        
        return ASSizeRangeMake(CGSize(width: width, height: 0), CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(section)
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cell = RepositoriesFeedCell(repository: viewModel.repositoryAtIndex(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        searchNode.delegate = self
        return searchNode.view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return searchNode.style.height.value
    }
    
    func tableView(_ tableView: ASTableView, willDisplay node: ASCellNode, forRowAt indexPath: IndexPath) {
        let rows = viewModel.numberOfRowInSection(indexPath.row)
        
        if rows >= 30, indexPath.row + 1 == rows  {
            viewModel.increasePage()
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        delegate?.navigate(with: viewModel.repositoryAtIndex(indexPath.row))
    }
}

// MARK: - Delegates
extension HomePresentation: SearchNodeDelegate {
    func search(for keyword: String) {
        viewModel.fetchData(for: keyword)
    }
    
    func clearList() {
        viewModel.clearData()
        table.reloadTableOnMain()
    }
}

extension HomePresentation: HomeViewModelDelegate {
    func reloadTable() {
        table.reloadTableOnMain()
    }
}
