//
//  NetworkImageRequest.swift
//  MyApp
//
//  Created by Андрей Абакумов on 05.04.2023.
//

import Foundation

class NetworkImageRequest {
    
    static let shared = NetworkImageRequest()
    private init() {}
    
    func requestData(id: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = "https://openweathermap.org/img/wn/\(id)@2x.png"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
