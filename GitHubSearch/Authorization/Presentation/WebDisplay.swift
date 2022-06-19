//
//  WebDisplay.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit
import WebKit

protocol WebDisplayDelegate: NSObject {
    func dismiss()
}

class WebDisplay: BaseNode {
    var viewModel: AuthViewModel!
    weak var delegate: WebDisplayDelegate?
    
    override init() {
        super.init()
        
        self.viewModel = AuthViewModel()
        viewModel.delegate = self
        
        self.setViewBlock({
            let webView: WKWebView = .init(frame: .zero)
            webView.navigationDelegate = self
            
            let uuid = UUID().uuidString
            let authURLFull = "https://github.com/login/oauth/authorize?client_id=" + GithubConstants.CLIENT_ID + "&scope=" + GithubConstants.SCOPE + "&redirect_uri=" + GithubConstants.REDIRECT_URI + "&state=" + uuid
            
            let urlRequest = URLRequest(url: URL(string: authURLFull)!)
            webView.load(urlRequest)
            
            return webView
        })
    }
}

extension WebDisplay: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        viewModel.requestForCallbackURL(request: navigationAction.request)
        decisionHandler(.allow)
    }
}

extension WebDisplay: AuthViewModelDelegate {
    func dismiss() {
        delegate?.dismiss()
    }
}
