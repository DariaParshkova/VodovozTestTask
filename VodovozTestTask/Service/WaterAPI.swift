//
//  WaterAPI.swift
//  VodovozTestTask
//
//  Created by Parshkova Daria on 14.08.2024.
//

import Foundation

final class WateraAPI: DataRepository  {
    
    func fetchData(completion: @escaping (Result<ResponseAPI, Error>) -> Void) {
       // let urlString = "https://szorin.vodovoz.ru/newmobile/glavnaya/super_top.php?action=topglav"
        let urlString = "https://szorin.vodovoz.ru/newmobile/glavnaya/super_top.php?action=topglav"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let responseObject = try JSONDecoder().decode(ResponseAPI.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
    
