//
//  SearchNode.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import Foundation
import AsyncDisplayKit

protocol SearchNodeDelegate {
    func search(for keyword: String)
    func clearList()
}

class SearchNode: ASDisplayNode {
    var delegate: SearchNodeDelegate?
    
    override init() {
        super.init()
        
        self.setViewBlock({
            let searchView: UISearchBar = .init(frame: .zero)
            searchView.placeholder = "Search Repository"
            searchView.backgroundColor = .clear
            searchView.searchBarStyle = .minimal
            searchView.delegate = self
            return searchView
        })
        self.style.height = .init(unit: .points, value: 50)
        self.backgroundColor = .white
    }
}

extension SearchNode: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            delegate?.search(for: searchText)
            searchBar.endEditing(true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            delegate?.clearList()
        }
    }
}
