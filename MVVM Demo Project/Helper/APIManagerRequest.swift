//
//  APIManagerRequest.swift
//  MVVM Demo Project
//
//  Created by Shiva Kaushik on 26/04/23.
//

import Foundation


enum HttpType: String
{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HttpType { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}
