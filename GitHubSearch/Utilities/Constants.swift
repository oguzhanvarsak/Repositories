//
//  Constants.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import Foundation

struct Url {
    static let search = "https://api.github.com/search/repositories?q=%@in:name&sort=stars&order=desc&page=%d"
    static let readme = "https://api.github.com/repos/%@/%@/readme"
}

struct GithubConstants {
    static let CLIENT_ID = "108abb34f4bf46f1a059"
    static let CLIENT_SECRET = "07ab844f38b550f1c2210f8723090cc7654d9044"
    static let REDIRECT_URI = "https://github.com/oguzhanvarsak"
    static let SCOPE = "read:user,user:email,repo"
    static let TOKENURL = "https://github.com/login/oauth/access_token"
}
