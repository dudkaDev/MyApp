//
//  NetworkRequest.swift
//  MyApp
//
//  Created by Андрей Абакумов on 05.04.2023.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    func requestData(completion: @escaping (Result<Data, Error>) -> Void) {
        let key = "af054d2df7fdc866863ec1bedc09035a"
        let latitude = 51.525385
        let longitude = 45.981797
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)"
        
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
