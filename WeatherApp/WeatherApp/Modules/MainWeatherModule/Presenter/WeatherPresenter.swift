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
        
    }
}
