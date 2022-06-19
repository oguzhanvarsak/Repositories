//
//  RepositoryDetail.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import Foundation

struct RepositoryDetail: Decodable {
    let name: String
    let path: String
    let sha: String
    let size: Int
    let url: String
    let htmlUrl: String
    let gitUrl: String
    let downloadUrl: String
    let type: String
    let content: String
    let encoding: String
    
    var encodedReadMe: String? {
        if let readMe = content.base64Decoded() {
            return readMe
        }
        
        return nil
    }
}

extension Item {
    var updateDate: Date? {
        if let updatedAt = updatedAt, let date = DateFormatter.dateFormatter.date(from: updatedAt) {
            return date
        }
        
        return nil
    }
    
    var createDate: Date? {
        if let createdAt = createdAt, let date = DateFormatter.dateFormatter.date(from: createdAt) {
            return date
        }
        
        return nil
    }
}
