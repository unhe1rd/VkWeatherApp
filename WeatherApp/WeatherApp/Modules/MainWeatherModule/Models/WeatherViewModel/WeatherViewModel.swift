//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 22.03.2024.
//

import Foundation
import UIKit

struct WeatherViewModel {
    let currentWeather: WeatherHeaderModel
    let dailyWeather: [WeatherCellModel]
}


struct WeatherHeaderModel {
    let date: Date
    let sunrise: Date
    let sunset: Date
    let temp: String
    let feels_like: String
    let pressure: String
    let humidity: String
    let uvi: String
    let visibility: String
    let wind_speed: String
    let wind_deg: String
    let wind_gust: String
    let weatherImage = UIImage()
    
    init(date: Date, sunrise: Date, sunset: Date, temp: String, feels_like: String, pressure: String, humidity: String, uvi: String, visibility: String, wind_speed: String, wind_deg: String, wind_gust: String) {
        self.date = date
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feels_like = feels_like
        self.pressure = pressure
        self.humidity = humidity
        self.uvi = uvi
        self.visibility = visibility
        self.wind_speed = wind_speed
        self.wind_deg = wind_deg
        self.wind_gust = wind_gust
    }
}

struct WeatherCellModel{
    let date: Date
    let day: String
    let minTemperature: Int
    let maxTemperature: Int
    let sunrise: Date
    let sunset: Date
    let moonrise: Date
    let moonset: Date
    let moon_phase: String
    let pressure: Int
    let humidity: Int
    let wind_speed: String
    let wind_deg: String
    let wind_gust: String
    let rainChance: Int
    let uvi: Double
    var weatherImage = UIImage()
        
    init(date: Date, day: String, minTemperature: Int, maxTemperature: Int, sunrise: Date, sunset: Date, moonrise: Date, moonset: Date, moon_phase: String, pressure: Int, humidity: Int, wind_speed: String, wind_deg: String, wind_gust: String, rainChance: Int, uvi: Double, weatherImage: UIImage = UIImage()) {
        self.date = date
        self.day = day
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
        self.sunrise = sunrise
        self.sunset = sunset
        self.moonrise = moonrise
        self.moonset = moonset
        self.moon_phase = moon_phase
        self.pressure = pressure
        self.humidity = humidity
        self.wind_speed = wind_speed
        self.wind_deg = wind_deg
        self.wind_gust = wind_gust
        self.rainChance = rainChance
        self.uvi = uvi
        self.weatherImage = weatherImage
    }
}
