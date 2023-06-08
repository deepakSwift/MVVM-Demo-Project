//
//  OTPRequest.swift
//  MVVM Demo Project
//
//  Created by Shiva Kaushik on 27/04/23.
//

import Foundation

struct OTPRequest: Codable {
    let device_type: String
    let phoneversion: String
    let fcmregistertoken: String
    let otp: String
    let phonemanufacture: String
    let appversion: String
    let device_token: String
    let phone: String
    let phoneimei: String
}
