//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 23.03.2024.
//

import Foundation

struct WeatherResponse: Decodable {
    let lat: Double
    let lon: Double
    let timezone: String
    let current: CurrentWeatherResponse
    let daily: [DailyWeatherResponse]
}

struct CurrentWeatherResponse: Decodable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let uvi: Double
    let clouds: Int?
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let weather: [Weather]
}

struct DailyWeatherResponse: Decodable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let moonrise: Int
    let moonset: Int
    let moon_phase: Double
    let temp: DailyTemp
    let pressure: Int
    let humidity: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let clouds: Int?
    let pop: Double?
    let rain: Double?
    let uvi: Double
    let weather: [Weather]
}

struct DailyTemp: Decodable {
    let day: Double
    let min: Double
    let max: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let icon: String
}
