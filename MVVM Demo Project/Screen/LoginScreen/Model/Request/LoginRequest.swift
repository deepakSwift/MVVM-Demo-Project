//
//  LoginRequest.swift
//  MVVM Demo Project
//
//  Created by Shiva Kaushik on 26/04/23.
//

import Foundation

struct LoginRequest: Codable {
    let device_type: String
    let phone: String
    let device_token: String
}
