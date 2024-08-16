//
//  ProductsViewCntroller.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import UIKit

class ProductsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var products: [ProductData] = []
    
    let productsLayout: UICollectionViewFlowLayout = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal
          layout.minimumLineSpacing = 10
          layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
          return layout
      }()
    
   lazy var  productsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: productsLayout)
         collectionView.backgroundColor = Resources.Colors.backgroundColor
         return collectionView
     }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func updateProducts(for category: Tovary) {
        products = category.data
        productsCollectionView.reloadData()
    }

    func setupUI() {
        view.addSubview(productsCollectionView)
        productsCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        productsCollectionView.delegate = self
        productsCollectionView.showsHorizontalScrollIndicator = false
        productsCollectionView.dataSource = self
        productsCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
    }

    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        if let product = products[safe: indexPath.item] {
            cell.configure(with: product)
        } else {
            // Логируем ошибку или устанавливаем данные по умолчанию
            print("Ошибка: продукт не найден для indexPath: \(indexPath)")
        }
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Resources.ItemFrames.itemWidth, height: Resources.ItemFrames.itemHeight)
       }
}



