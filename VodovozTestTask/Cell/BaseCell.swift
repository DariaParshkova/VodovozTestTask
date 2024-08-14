//
//  BaseCell.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import UIKit

class BaseCell: UICollectionViewCell {
  static var reuseIdentifier: String {
      String(describing: Self.self)
  }
}
