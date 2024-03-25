//
//  SearchPresenter.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//


import Foundation
import UIKit

final class SearchPresenter {
    weak var view : SearchViewInput?
    weak var moduleOutput: SearchModuleOutput?
    private var searchDebouncer: Debouncer?
}

extension SearchPresenter: SearchModuleOutput{}

extension SearchPresenter: SearchViewOutput{
    func didLoadView(){
        loadData(city: "Moscow")
    }
    
    func didChangeSearchText(_ searchText: String) {
        searchDebouncer?.reset()
        searchDebouncer = Debouncer(delay: 1) { [weak self] in
            self?.loadData(city: searchText)
        }
        searchDebouncer?.call()
    }
    
    func didTapOnCityTabel(_ city: String) {
        loadData(city: city)
    }
}

private extension SearchPresenter{
    func loadData(city: String){
        let networkManager = SearchNetworkManager.shared
        networkManager.loadWeather(city: city) { [weak self] result in
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
    
    func updateUI(with rowWeather: SearchResponse){
        var weatherImage = UIImage()
        if rowWeather.weather[0].main == "Rain" {
            weatherImage = UIImage(systemName: "cloud.rain") ?? UIImage(systemName: "exclamationmark.icloud.fill")!
        } else if rowWeather.weather[0].main == "Clouds" {
            weatherImage = UIImage(systemName: "cloud.rain") ?? UIImage(systemName: "exclamationmark.icloud.fill")!
        } else if rowWeather.weather[0].main == "Clear" {
            weatherImage = UIImage(systemName: "sun.max")!
        } else {
            print(rowWeather.weather[0].main)
            weatherImage = UIImage(systemName: "exclamationmark.icloud.fill")!
        }
        
        let weather: SearchViewModel = .init(
            cityName: rowWeather.name,
            windSpeed: String(rowWeather.wind.speed),
            date: setupDate(timestamp: rowWeather.dt),
            sunrise: setupDateWithHoursAndMinutes(timestamp: rowWeather.sys.sunrise),
            sunset: setupDateWithHoursAndMinutes(timestamp: rowWeather.sys.sunset),
            temp: String(rowWeather.main.temp),
            pressure: String(rowWeather.main.pressure),
            humidity: String(rowWeather.main.humidity),
            weatherImage: weatherImage
        )
        view?.configure(with: weather)
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
        dateFormatter.dateFormat = "HH:mm"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
