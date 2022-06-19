//
//  DetailViewModel.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import Foundation

protocol DetailViewModelDelegate: NSObject {
    func reloadMarkdown(with data: String)
}

class DetailViewModel {
    private var service: WebServiceProtocol
    weak var delegate: DetailViewModelDelegate?
    
    var repository: Repository!
    
    var readMe: String? {
        didSet {
            delegate?.reloadMarkdown(with: readMe!)
        }
    }
    
    init(repository: Repository) {
        self.repository = repository
        self.service = WebService()
    }
    
    func fetchData() {
        service.getData(url: String(format: Url.readme, (repository.owner?.login)!, repository.name!),
                        baseModel: RepositoryDetail.self, model: RepositoryDetail.self,
                        completion: { result in
            switch result {
                case .success(let item as RepositoryDetail):
                    self.readMe = item.encodedReadMe
                case .failure(let error):
                    break
                default:
                    break
            }
        })
    }
}
