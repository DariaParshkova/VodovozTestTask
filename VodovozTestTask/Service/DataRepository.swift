//
//  DataRepository.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import Foundation

protocol DataRepository {
    func fetchData(completion: @escaping (Result<ResponseAPI, Error>) -> Void)
}
