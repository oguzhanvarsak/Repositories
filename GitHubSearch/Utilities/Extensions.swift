//
//  Extensions.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 19.06.2022.
//

import AsyncDisplayKit
import WebKit

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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return formatter
    }()
    
    static let dateOnly: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "dd/MM/yyyy"
         return formatter
    }()
    
    static func string(from string: String) -> String {
        let date = DateFormatter.dateFormatter.date(from: string)!
        return DateFormatter.dateOnly.string(from: date)
    }
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

final class WebCacheCleaner {
    class func clear() {
        URLCache.shared.removeAllCachedResponses()

        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)

        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
            }
        }
    }
}
