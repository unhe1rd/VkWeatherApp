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
    let date: String
    let sunrise: String
    let sunset: String
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
    
    init(date: String, sunrise: String, sunset: String, temp: String, feels_like: String, pressure: String, humidity: String, uvi: String, visibility: String, wind_speed: String, wind_deg: String, wind_gust: String) {
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
    let date: String
    let day: String
    let minTemperature: String
    let maxTemperature: String
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moon_phase: String
    let pressure: String
    let humidity: String
    let wind_speed: String
    let wind_deg: String
    let wind_gust: String
    let rainChance: Double
    let uvi: String
    var weatherImage = UIImage()
        
    init(date: String, day: String, minTemperature: String, maxTemperature: String, sunrise: String, sunset: String, moonrise: String, moonset: String, moon_phase: String, pressure: String, humidity: String, wind_speed: String, wind_deg: String, wind_gust: String, rainChance: Double, uvi: String, weatherImage: UIImage = UIImage()) {
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
