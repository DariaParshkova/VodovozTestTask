//
//  ResponseAPI.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import Foundation
// Основная структура для всего ответа
struct ResponseAPI: Codable {
    let status: String
    let message: String
    let tovary: [Tovary]

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case tovary = "TOVARY"
    }
}
