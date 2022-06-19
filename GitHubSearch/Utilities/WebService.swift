//
//  WebService.swift
//  GitHubSearch
//
//  Created by Oğuzhan Varsak on 18.06.2022.
//

import UIKit
import Foundation

protocol WebServiceProtocol {
    func parseJSON<B: Decodable>(data: Data, model: B.Type) -> Result<Decodable?, NetworkError>
    func getData<T: Decodable, B: Decodable>(url: String, baseModel: B.Type, model: T.Type,
                                           completion: @escaping (Result<Decodable?, NetworkError>) -> Void)
}

class WebService: WebServiceProtocol {
    let utilityQueue = DispatchQueue.global(qos: .utility)

    func getData<T: Decodable, B: Decodable>(url: String, baseModel: B.Type, model: T.Type,
                               completion: @escaping (Result<Decodable?, NetworkError>) -> Void) {
        if let url = URL(string: url) {
            
            let loginString = "\(Secrets.username):\(Secrets.apiKey)"
            
            guard let loginData = loginString.data(using: String.Encoding.utf8) else {
                return
            }
            let base64LoginString = loginData.base64EncodedString()
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(.noInternetConnection))
                } else {
                    if let data = data {
                        if let response = try? self.parseJSON(data: data, model: B.self).get() {
                            completion(.success(response))
                        }
                    }
                }
            }.resume()
            
        } else {
            completion(.failure(.badUrl))
        }
    }
    
    func parseJSON<B: Decodable>(data: Data, model: B.Type) -> Result<Decodable?, NetworkError> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let decodedData = try decoder.decode(B.self, from: data)
            
            return .success(decodedData)
        } catch {
            print(error)
            return .failure(.errorParsingJSON(error.localizedDescription))
        }
    }
}

