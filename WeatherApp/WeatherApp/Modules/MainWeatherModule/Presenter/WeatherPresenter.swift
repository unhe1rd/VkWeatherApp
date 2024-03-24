//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 22.03.2024.
//

import Foundation
import UIKit

final class WeatherPresenter {
    weak var view : WeatherViewInput?
    weak var moduleOutput: WeatherModuleOutput?
}

extension WeatherPresenter: WeatherModuleOutput{}

extension WeatherPresenter: WeatherViewOutput{
    func didLoadView() {
        loadData()
    }
    
    func getLocation() {
        
    }
}

private extension WeatherPresenter{
    func loadData(){
        let networkManager = NetworkManager.shared
        networkManager.loadWeather() { [weak self] result in
            DispatchQueue.global().async {
                switch result {
                case .success(let weather):
                    self?.updateUI(with: weather)
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    func updateUI(with weather: WeatherResponse){
        
        let currentWeather: WeatherHeaderModel = .init(
            date: setupDate(timestamp: weather.current.dt),
            sunrise: setupDateWithHoursAndMinutes(timestamp: weather.current.sunrise),
            sunset: setupDateWithHoursAndMinutes(timestamp: weather.current.sunset),
            temp: String(Int(weather.current.temp)) + "°",
            feels_like: String(weather.current.feels_like),
            pressure: String(weather.current.pressure),
            humidity: String(weather.current.humidity),
            uvi: String(weather.current.uvi),
            visibility: String(weather.current.visibility),
            wind_speed: String(weather.current.wind_speed),
            wind_deg: String(weather.current.wind_deg),
            wind_gust: String(weather.current.wind_gust))
        
        let dailyWeather = weather.daily.map { itemWeather in
            let date = setupDate(timestamp: itemWeather.dt)
            
            var weatherImage = UIImage()
            if itemWeather.weather[0].main == "Rain" {
                weatherImage = UIImage(systemName: "cloud.rain") ?? UIImage(systemName: "exclamationmark.icloud.fill")!
            } else if itemWeather.weather[0].main == "Clouds" {
                weatherImage = UIImage(systemName: "cloud.rain") ?? UIImage(systemName: "exclamationmark.icloud.fill")!
            } else if itemWeather.weather[0].main == "Clear" {
                weatherImage = UIImage(systemName: "sun.max")!
            } else {
                print(itemWeather.weather[0].main)
                weatherImage = UIImage(systemName: "exclamationmark.icloud.fill")!
            }
            
            return WeatherCellModel(
                date: date,
                day: getWeekdayName(from: date),
                minTemperature: String(Int(itemWeather.temp.min)) + "°",
                maxTemperature: String(Int(itemWeather.temp.max)) + "°",
                sunrise: setupDateWithHoursAndMinutes(timestamp: itemWeather.sunrise),
                sunset: setupDateWithHoursAndMinutes(timestamp: itemWeather.sunset),
                moonrise: setupDateWithHoursAndMinutes(timestamp: itemWeather.moonrise),
                moonset: setupDateWithHoursAndMinutes(timestamp: itemWeather.moonset),
                moon_phase: String(itemWeather.moon_phase),
                pressure: String(itemWeather.moon_phase),
                humidity: String(itemWeather.humidity),
                wind_speed: String(itemWeather.wind_speed),
                wind_deg: String(itemWeather.wind_deg),
                wind_gust: String(itemWeather.wind_gust),
                rainChance: Double(itemWeather.pop ?? 0),
                uvi: String(itemWeather.uvi),
                weatherImage: weatherImage
            )
            
        }
        let weatherModel: WeatherViewModel = .init(currentWeather: currentWeather, dailyWeather: dailyWeather)
        view?.configure(with: weatherModel)
    }
    
    func setupDate(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    func setupDateWithHoursAndMinutes(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy HH:mm"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    func getWeekdayName(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy HH:mm"
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let weekDay = calendar.component(.weekday, from: date)
            dateFormatter.locale = Locale(identifier: "ru_RU") // Установка региональных настроек для вывода названия на русском
            return dateFormatter.weekdaySymbols[weekDay - 1]
        } else {
            return "Неверный формат даты"
        }
    }
}
