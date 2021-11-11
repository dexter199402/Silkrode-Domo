//
//  Data.swift
//  Silkrode_Domo
//
//  Created by weihao qiu on 2021/11/11.
//

import Foundation

struct User: Codable {
    let login: String
    let type: String
    let avatar_url: String
}

struct User_de: Codable {
    let name: String?
    let location: String?
    let email: String?
}

