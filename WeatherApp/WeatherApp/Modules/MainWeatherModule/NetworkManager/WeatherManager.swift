//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 23.03.2024.
//

import Foundation

protocol NetworkManagerDescription {
    func loadWeather(completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case noData
}

final class NetworkManager: NetworkManagerDescription {
    
    static let shared: NetworkManagerDescription = NetworkManager()
    
    static let appId = "5aa741a37ff6512516bcb3da3ea973f0"
    //b1b35bba8b434a28a0be2a3e1071ae5b
    private init() {}
    
    func loadWeather(completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        
        let lat = UserDefaults.standard.double(forKey: "latitude")
        let lon = UserDefaults.standard.double(forKey: "longitude")
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&appid=\(NetworkManager.appId)&units=metric") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        print(url)

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(WeatherResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        
        dataTask.resume()
    }
}
