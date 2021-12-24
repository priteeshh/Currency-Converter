//
//  Currency.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 23/12/21.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CurrencyResult: Codable {
    let error : String?
    let result: [String: Double]?
}
