//
//  Tovary.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import Foundation
// Структура для представления каждой категории товара
struct Tovary: Codable {
    let id: Int
    let name: String
    let data: [ProductData]

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "NAME"
        case data
    }
}

