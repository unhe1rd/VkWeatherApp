//
//  SearchProtocols.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import Foundation

protocol SearchModuleInput {
    var moduleOutput: SearchModuleOutput? { get }
}

protocol SearchModuleOutput: AnyObject {
}

protocol SearchViewInput: AnyObject {
    func configure(with model: SearchViewModel)
    func configureCityView(with model: SearchViewModel, cityName: String)
}

protocol SearchViewOutput: AnyObject {
    func didLoadView()
    func didChangeSearchText(_ searchText: String)
    func didTapOnCityTabel(_ city: String)
}
