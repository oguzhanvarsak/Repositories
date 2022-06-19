//
//  Extensions.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit

extension ASTableNode {
    func reloadTableOnMain() {
        DispatchQueue.main.async {
            UIView.performWithoutAnimation {
                self.reloadData()
            }
        }
    }
}
