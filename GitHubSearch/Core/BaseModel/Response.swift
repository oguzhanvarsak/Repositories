//
//  Response.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import Foundation

typealias Repositories = [Item]

struct Response: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: Repositories
}
