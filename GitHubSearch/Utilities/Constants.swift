//
//  Constants.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import Foundation

struct Url {
    static let search = "https://api.github.com/search/repositories?q=%@in:name&sort=stars&order=desc&page=%d"
}

struct Secrets {
    static let username = "oguzhanvarsak"
    static let apiKey = "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"
}
