//
//  SearchNetworkManager.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import Foundation

protocol SearchManagerDescription {
    func loadWeather(city: String, completion: @escaping (Result<SearchResponse, Error>) -> Void)
}

final class SearchNetworkManager: SearchManagerDescription {
    
    static let shared: SearchManagerDescription = SearchNetworkManager()
    
    static let appId = "b1b35bba8b434a28a0be2a3e1071ae5b"
    
    private init() {}
    
    func loadWeather(city: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(NetworkManager.appId)&units=metric") else {
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
                let response = try decoder.decode(SearchResponse.self, from: data)
                print(response)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        
        dataTask.resume()
    }
}
