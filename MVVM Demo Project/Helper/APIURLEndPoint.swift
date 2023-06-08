//
//  APIURLEndPoint.swift
//  MVVM Demo Project
//
//  Created by Shiva Kaushik on 27/04/23.
//

import Foundation

enum APIURLEndPoint {
    case logIn(signInRequest: LoginRequest)
}

extension APIURLEndPoint: EndPointType {
    
    var path: String {
        switch self {
        case .logIn:
            return "login"
        }
    }
    
    var baseURL: String {
        switch self {
        case .logIn:
            return "https://canary.revfintech.com/v3/api/"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HttpType {
        switch self {
        case .logIn:
            return .post
        }
    }
    
    var body: Encodable? {
        switch self {
        case .logIn(let requestForLogin):
            return requestForLogin
            
        }
    }
    
    var headers: [String : String]? {
        APIManager.commonHeaders
    }
    
    
}
