//
//  ProductCell.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import UIKit
import Foundation
import Kingfisher

final class ProductCell: BaseCell {
    private let imageView = UIImageView()
    private let addFavourite = UIButton()
    private let addBusket = UIButton()
    private let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupShadow() {
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
    }
        
    func configure(with product: ProductData) {
        let priceText = "\(product.extendedPrice.first?.price ?? 0)"
        
        let boldFont = UIFont.systemFont(ofSize: 18, weight: .heavy)
        let normalFont = UIFont.systemFont(ofSize: 14)
        
        let attributedString = NSMutableAttributedString(
            string: "\(priceText) P",
            attributes: [NSAttributedString.Key.font: normalFont]
        )
        
        let boldTextRange = NSRange(location: 0, length: priceText.count)
        attributedString.addAttributes(
            [NSAttributedString.Key.font: boldFont],
            range: boldTextRange
        )
        
        priceLabel.attributedText = attributedString
    
        if let relativePath = product.detailPicture,
           let url = URL(string: Constants.baseURL + relativePath) {
            imageView.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "antenna.radiowaves.left.and.right.slash"),
                options: [.transition(.fade(0.2))]
            )
        } else {
            imageView.image = nil
        }
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        
        addFavourite.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        /*addFavourite.imageView?.contentMode = .scaleAspectFit
        addFavourite.setContentHuggingPriority(.defaultLow, for: .horizontal) // Уменьшает приоритет "обнимания" контента
        addFavourite.setContentCompressionResistancePriority(.defaultLow, for: .horizontal) // Уменьшает приоритет сжатия*/
        
        addBusket.setImage(UIImage(systemName: "cart"), for: .normal)
      //  addBusket.imageView?.contentMode = .scaleAspectFit
        
        contentView.addSubview(addFavourite)
        contentView.addSubview(imageView)
        contentView.addSubview(addBusket)
        contentView.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        addFavourite.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        addBusket.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addFavourite.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            addFavourite.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addFavourite.heightAnchor.constraint(equalToConstant: 60),
            addFavourite.widthAnchor.constraint(equalToConstant: 40),
            
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 104),
            imageView.heightAnchor.constraint(equalToConstant: 104),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            addBusket.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            addBusket.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            addBusket.widthAnchor.constraint(equalToConstant: 60),
            addBusket.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}


