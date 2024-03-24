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
//                self?.activityIndicatorView.stopAnimating()
//                self?.doneButton.isEnabled = true
                
                switch result {
                case .success(let weather):
                    print(weather)
                    self?.updateUI(with: weather)
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    func updateUI(with weather: WeatherResponse){
    }
}
