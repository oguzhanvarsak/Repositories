//
//  AuthViewModel.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import Foundation

protocol AuthViewModelDelegate: NSObject {
    func dismiss()
}

final class AuthViewModel {
    weak var delegate: AuthViewModelDelegate?
    
    func requestForCallbackURL(request: URLRequest) {
        let requestURLString = (request.url?.absoluteString)! as String
        print(requestURLString)
        
        if requestURLString.hasPrefix(GithubConstants.REDIRECT_URI),
            requestURLString.contains("code="),
            let range = requestURLString.range(of: "=") {
            
            let githubCode = requestURLString[range.upperBound...]
            
            if let range = githubCode.range(of: "&state=") {
                let githubCodeFinal = githubCode[..<range.lowerBound]
                githubRequestForAccessToken(authCode: String(githubCodeFinal))
            }
        }
    }

    func githubRequestForAccessToken(authCode: String) {
        let grantType = "authorization_code"
        let postParams = "grant_type=" + grantType + "&code=" + authCode + "&client_id=" + GithubConstants.CLIENT_ID + "&client_secret=" + GithubConstants.CLIENT_SECRET
        
        let postData = postParams.data(using: String.Encoding.utf8)
        let request = NSMutableURLRequest(url: URL(string: GithubConstants.TOKENURL)!)
        
        request.httpMethod = "POST"
        request.httpBody = postData
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, _) -> Void in
            let statusCode = (response as! HTTPURLResponse).statusCode
            if statusCode == 200 {
                let results = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyHashable: Any]
                let accessToken = results?["access_token"] as! String
                
                self.fetchGitHubUserProfile(accessToken: accessToken)
                
                self.delegate?.dismiss()
            }
        }.resume()
    }

    func fetchGitHubUserProfile(accessToken: String) {
        let tokenURLFull = "https://api.github.com/user"
        let verify: NSURL = NSURL(string: tokenURLFull)!
        let request: NSMutableURLRequest = NSMutableURLRequest(url: verify as URL)
        
        request.addValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            if error == nil {
                let result = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyHashable: Any]
                
                let defaults = UserDefaults.standard
                
                defaults.set(accessToken, forKey: "accessToken")
                defaults.set(result?["login"] as! String, forKey: "username")
                defaults.set(result?["avatar_url"] as! String, forKey: "avatarUrl")
            }
        }.resume()
    }
}
