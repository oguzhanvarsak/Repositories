//
//  Errors.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case errorParsingJSON(String)
    case noInternetConnection
    case dataReturnedNil
    case returnedError(Error)
    case invalidStatusCode(Int)
    case customError(String)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .noInternetConnection:
                return NSLocalizedString("The Internet connection appears to be offline.", comment: "No Connection")
            case .badUrl:
                return NSLocalizedString("The URL is in wrong format", comment: "Bad Url")
            case .errorParsingJSON(let error):
                return NSLocalizedString(error, comment: "Parse Error")
            case .dataReturnedNil:
                return NSLocalizedString("The Image could not load.", comment: "Empty Image Data")
            case .returnedError(let error):
                return NSLocalizedString(error.localizedDescription, comment: "Unknown Error")
            case .invalidStatusCode(let statusCode):
                return NSLocalizedString("Unknown Status Code: \(statusCode)", comment: "Invalid Status Code")
            case .customError(let error):
                return NSLocalizedString(error, comment: "Custom Error")
        }
    }
}
