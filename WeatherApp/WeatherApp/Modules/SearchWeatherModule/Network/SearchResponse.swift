//
//  SearchRequest.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import Foundation

struct SearchResponse: Decodable {
    let weather: [SearchWeather]
    let main: SearchCity
    let wind: SearchWind //
    let dt: Int //
    let name: String //
    let sys: SearchSys //
}

struct SearchWeather: Decodable {
    let id: Int
    let main: String
    let icon: String
}

struct SearchCity: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct SearchWind: Decodable {
    let speed: Double
}

struct SearchSys: Decodable {
    let sunrise: Int
    let sunset: Int
}
