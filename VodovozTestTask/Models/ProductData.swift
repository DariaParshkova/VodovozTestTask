//
//  ProductData.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import Foundation

struct ProductData: Codable {
    let id, iblockID: String
    let name, dateActiveFrom: String?
    let detailPicture: String?
    let extendedPrice: [ExtendedPrice]
    let favorite: Bool
    
     
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case iblockID = "IBLOCK_ID"
        case name = "NAME"
        case dateActiveFrom = "DATE_ACTIVE_FROM"
        case detailPicture = "DETAIL_PICTURE"
        case extendedPrice = "EXTENDED_PRICE"
        case favorite = "FAVORITE"
       
    }
}

