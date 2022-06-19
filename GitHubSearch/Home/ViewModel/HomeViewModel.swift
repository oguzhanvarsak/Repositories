//
//  HomeViewModel.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import Foundation

protocol HomeViewModelDelegate: NSObject {
    func reloadTable()
}

class HomeViewModel {
    private var repositories = Repositories()
    private var service: WebServiceProtocol
    private var searchKeyword = ""
    private var pageNumber: Int {
        repositories.count / 30 + 1 // API returns same data on pages for 0 and 1.
    }
    
    weak var delegate: HomeViewModelDelegate?
    
    init() {
        self.service = WebService()
    }
    
    func fetchData(for keyword: String, isRefresh: Bool = false) {
        searchKeyword = keyword
        service.getRepositories(url: String(format: Url.search, searchKeyword, pageNumber), completion: { result in
            switch result {
            case .success(let repositories):
                if !isRefresh {
                    self.repositories = repositories!
                } else {
                    self.repositories += repositories!
                }
                    
                self.delegate?.reloadTable()
            case .failure(let error):
                    break
            }
        })
    }
}

extension HomeViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowInSection (_ section: Int) -> Int {
        return repositories.count
    }
    
    func repositoryAtIndex (_ index: Int) -> Repository {
        return repositories[index]
    }
    
    func clearData() {
        repositories.removeAll()
    }
    
    func increasePage() {
        fetchData(for: searchKeyword, isRefresh: true)
    }
}
