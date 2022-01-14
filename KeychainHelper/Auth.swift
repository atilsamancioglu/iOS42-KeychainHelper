//
//  Auth.swift
//  KeychainHelper
//
//  Created by Atil Samancioglu on 14.01.2022.
//

import Foundation

struct Auth: Codable {
    let accessToken: String
    let refreshToken: String
}
