//
//  Resources.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import UIKit

enum Resources {
    enum Colors {
        static let backgroundColor = UIColor.white
        static let selected = UIColor.systemBlue
        static let notSelected = UIColor.black
        static let shadowColor = UIColor.gray.cgColor
        static let categoriesCollectionViewColor = UIColor.clear
    }
    enum Icons {
        static let heart = UIImage(systemName: "suit.heart")
        static let cart = UIImage(systemName: "cart")
    }
    enum Fonts {
        static let normalFont = UIFont.systemFont(ofSize: 18)
        static let boldFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    enum ItemFrames {
        static let itemWidth: CGFloat = 180
        static  let itemHeight: CGFloat = 192
    }
    enum ConstantsForProductCell {
        static let cornerRadius: CGFloat = 8
        static let shadowOffset = CGSize(width: 0, height: 3)
        static let shadowOpacity: Float = 0.3
        static let shadowRadius: CGFloat = 4
        static let favouriteButtonSize = CGSize(width: 40, height: 60)
        static let imageSize = CGSize(width: 104, height: 104)
        static let busketButtonSize = CGSize(width: 60, height: 40)
        static let edgePadding: CGFloat = 15
    }
}



