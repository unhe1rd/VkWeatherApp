//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import Foundation
import UIKit

struct SearchViewModel {
    let cityName: String
    let windSpeed: String
    let date: String
    let sunrise: String
    let sunset: String
    let temp: String
    let pressure: String
    let humidity: String
    var weatherImage = UIImage()
    
    init(cityName: String, windSpeed: String, date: String, sunrise: String, sunset: String, temp: String, pressure: String, humidity: String, weatherImage: UIImage = UIImage()){
        self.date = date
        self.cityName = cityName
        self.temp = temp
        self.windSpeed = windSpeed
        self.sunrise = sunrise
        self.sunset = sunset
        self.pressure = pressure
        self.humidity = humidity
        self.weatherImage = weatherImage
    }
}

enum PopularCity: String, CaseIterable {
    case newYork = "New York"
    case moscow = "Moscow"
    case novosibirsk = "Novosibirsk"
    case yekaterinburg = "Yekaterinburg"
    case nizhnyNovgorod = "Nizhny Novgorod"
    case paris = "Paris"
    case london = "London"
    case dubai = "Dubai"
    case tokyo = "Tokyo"
    case singapore = "Singapore"
    case seoul = "Seoul"
    case barcelona = "Barcelona"
    case rome = "Rome"
    case mumbai = "Mumbai"
    case newDelhi = "New Delhi"
    case beijing = "Beijing"
    case sydney = "Sydney"
    case stPetersburg = "St. Petersburg"
    case vancouver = "Vancouver"
    case capeTown = "Cape Town"
}
