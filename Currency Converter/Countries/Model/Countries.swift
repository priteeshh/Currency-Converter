//
//  Countries.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 23/12/21.
//

import Foundation

// MARK: - Country
struct Country: Codable {
    let name: String
    let currency: Currency
    let flag: String
}

// MARK: - Currency
struct Currency: Codable {
    let code, name: String
}
typealias Countries = [Country]
