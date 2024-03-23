//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 22.03.2024.
//

import Foundation
import UIKit

struct WeatherViewModel{
    let day: String
    let temperature: Double
    
    
    init(day: String, temperature: Double) {
        self.day = day
        self.temperature = temperature
    }
    
}
