//
//  HomeDataSource.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import AsyncDisplayKit
import UIKit
import Foundation

class HomeDataSource: NSObject, ASTableDataSource, ASTableDelegate {
    var reloadTableView: (() -> Void)?
    
    private var dataSource: Repositories?
    private var service = WebService()
    private var pageNumber = 1
    private var searchKeyword = ""
    
    let searchNode = SearchNode()
    
    func fetchData(for keyword: String, isRefresh: Bool = false) {
        searchKeyword = keyword
        service.getRepositories(url: String(format: Url.search, searchKeyword, pageNumber), completion: { result in
            switch result {
            case .success(let repositories):
                if !isRefresh {
                    self.dataSource = repositories
                } else {
                    self.dataSource! += repositories!
                }
                    
                self.reloadTableView?()
            case .failure(let error):
                break
            }
        })
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let cell = RepositoriesFeedCell(repository: (dataSource?[indexPath.row])!)
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
        if indexPath.row + 1 == dataSource?.count {
            self.pageNumber += 1
            fetchData(for: searchKeyword, isRefresh: true)
        }
    }
}

extension HomeDataSource: SearchNodeDelegate {
    func search(for keyword: String) {
        fetchData(for: keyword)
    }
    
    func clearList() {
        dataSource?.removeAll()
        self.reloadTableView?()
    }
}
