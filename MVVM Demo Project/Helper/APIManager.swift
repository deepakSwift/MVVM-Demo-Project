//
//  APIManager.swift
//  MVVM Demo Project
//
//  Created by Shiva Kaushik on 26/04/23.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler<T> = (Result<T, DataError>) -> Void





class APIManager {
    
    static let shared = APIManager()
    
    func request <T: Codable> (modelType: T.Type,
                               type: EndPointType,
                               completion: @escaping Handler<T>
    ) {
        
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue
        
        if let parameters = type.body {
            request.httpBody = try? JSONEncoder().encode(parameters)
            print(request.httpBody)
            print(parameters)
        }
        
        request.allHTTPHeaderFields = type.headers
        
        // Background Task
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            print(response)
            do {
                let responseData = try JSONDecoder().decode(modelType, from: data)
                completion(.success(responseData))
                print(responseData)
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
        
    }
    
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
}
