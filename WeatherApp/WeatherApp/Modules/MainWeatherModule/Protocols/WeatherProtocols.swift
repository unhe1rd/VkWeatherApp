//
//  WeatherProtocols.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 22.03.2024.
//

import Foundation


protocol WeatherModuleInput {
    var moduleOutput: WeatherModuleOutput? { get }
}

protocol WeatherModuleOutput: AnyObject {
}

protocol WeatherViewInput: AnyObject {
    func configure(with model: WeatherViewModel)
}

protocol WeatherViewOutput: AnyObject {
    func didLoadView()
}
