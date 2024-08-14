//
//  RootViewController.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import UIKit

class RootViewController: UIViewController {

    private let categoriesViewController = CategoriesViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        addChild(categoriesViewController)
        view.addSubview(categoriesViewController.view)
        view.backgroundColor = .white
        
        categoriesViewController.didMove(toParent: self)
        categoriesViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoriesViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            categoriesViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

