//
//  HomeViewModel.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import Foundation

protocol HomeViewModelDelegate: NSObject {
    func reloadTable()
    func presentAlert(describing error: String)
}

final class HomeViewModel {
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
        service.getData(url: String(format: Url.search, searchKeyword, pageNumber),
                        baseModel: Response.self, model: Repositories.self,
                        completion: { result in
            switch result {
            case .success(let items as Response):
                if !isRefresh {
                    self.repositories = items.items
                } else {
                    self.repositories += items.items
                }
                    
                self.delegate?.reloadTable()
            case .failure(let error):
                self.delegate?.presentAlert(describing: error.errorDescription!)
            default:
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
