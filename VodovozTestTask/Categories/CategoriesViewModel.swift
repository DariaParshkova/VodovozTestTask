//
//  CategoriesViewModel.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import Foundation

protocol CategoriesViewModelDelegate: AnyObject {
    func updateProducts()
    func reloadData()
    func hideSections()
}

protocol CategoriesViewModel: AnyObject {
    var categories: [Tovary] { get set }
    var delegate: CategoriesViewModelDelegate? { get set }
    func loadData()
}

final class CategoriesViewModelA: CategoriesViewModel {
    
    var categories: [Tovary] = []
    let dataRepository = DataAPI()
    weak var delegate: CategoriesViewModelDelegate?
    
    func loadData() {
        dataRepository.fetchData { [weak self] result in
            switch result {
            case .success(let response):
                if response.status == "Success" {
                    self?.categories = response.tovary
                    DispatchQueue.main.async {
                        self?.delegate?.reloadData()
                        self?.delegate?.updateProducts()
                    }
                } else if response.status == "Error" {
                    self?.delegate?.hideSections()
                }
            case .failure(let error):
                print("Fetch Data Error: \(error.localizedDescription)")
            }
        }
    }
}
