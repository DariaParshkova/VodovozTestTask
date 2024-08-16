//
//  CategoriesViewController.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//
import UIKit

final class CategoriesViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    private var selectCategoryIndex = 0
    private let categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let productsViewController = ProductsViewController()
    private let viewModel: CategoriesViewModel = CategoriesViewModelA()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.loadData()
        setupUI()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        
        return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            return createCategories()
        }, configuration: configuration)
    }
    
    private func createCategories() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(124),
            heightDimension: .absolute(40)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 24
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(104),
            heightDimension: .absolute(36)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
                
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 4
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.interGroupSpacing = 8
        return section
    }
    
    private func setupUI() {
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        view.addSubview(categoriesCollectionView)
        
        addChild(productsViewController)
        view.addSubview(productsViewController.view)
        productsViewController.didMove(toParent: self)
        productsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 52),
            
            productsViewController.view.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor),
            productsViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsViewController.view.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        categoriesCollectionView.backgroundColor = .clear
        categoriesCollectionView.alwaysBounceVertical = false
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        
        categoriesCollectionView.collectionViewLayout = createLayout()
    }
        
    private func updateProductsViewController() {
        guard !viewModel.categories.isEmpty else { return }
        let selectedCategory = viewModel.categories[selectCategoryIndex]
        
        UIView.transition(with: productsViewController.view,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            self.productsViewController.updateProducts(for: selectedCategory)
        })
    }
    
    private func selectFirstCategory() {
        guard !viewModel.categories.isEmpty else { return }
        selectCategoryIndex = 0
        let indexPath = IndexPath(item: selectCategoryIndex, section: 0)
        categoriesCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        updateProductsViewController()
    }
    
    private func scrollToInitialPosition() {
        productsViewController.productsCollectionView.setContentOffset(.zero, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension CategoriesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell,
              let category = viewModel.categories[safe: indexPath.item] else {
            return UICollectionViewCell()
        }
        cell.configure(with: category, isSelected: true)
        return cell
    }
}


// MARK: - UICollectionViewDelegate

extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCategoryIndex = indexPath.item
        updateProductsViewController()
        
        scrollToInitialPosition()
    }
}

// MARK: - CategoriesViewModelDelegate

extension CategoriesViewController: CategoriesViewModelDelegate {

    func updateProducts() {
        updateProductsViewController()
    }
    
    func hideSections() {
        categoriesCollectionView.isHidden = true
        productsViewController.view.isHidden = true
    }
    
    func reloadData() {
        categoriesCollectionView.reloadData()
        selectFirstCategory()
    }
}

