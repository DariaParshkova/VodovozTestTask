//
//  ProductsViewCntroller.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import UIKit

class ProductsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var products: [ProductData] = []
    
    let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func updateProducts(for category: Tovary) {
        let oldProducts = products
        products = category.data

        let oldIndexPaths = oldProducts.indices.map { IndexPath(item: $0, section: 0) }
        let newIndexPaths = products.indices.map { IndexPath(item: $0, section: 0) }
        
        productsCollectionView.performBatchUpdates({
            productsCollectionView.deleteItems(at: oldIndexPaths)
            productsCollectionView.insertItems(at: newIndexPaths)
        })
    }
    
    func setupUI() {
        view.addSubview(productsCollectionView)
        productsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell, let product = products[safe: indexPath.item] else {
            return UICollectionViewCell()
        }
        cell.configure(with: product)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 192)
    }
}



