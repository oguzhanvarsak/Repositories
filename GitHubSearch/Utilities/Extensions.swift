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

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return df
    }()
}

extension UIScreen {
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
}

extension String {
    func base64Decoded() -> String? {
        let clearedString = self.replacingOccurrences(of: "\n", with: "")
        guard let data = Data(base64Encoded: clearedString) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
