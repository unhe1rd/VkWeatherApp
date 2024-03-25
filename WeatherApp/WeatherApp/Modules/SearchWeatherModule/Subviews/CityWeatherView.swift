//
//  SearchSubview.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import UIKit

final class CityWeatherView: UIView {
//    let windSpeed: String
//    let sunrise: String
    
//    let sunset: String
    
//    let temp: String
//    let pressure: String
//    let humidity: String
//    var weatherImage = UIImage()
    private let cityNameLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let temperatureView = UIView()
    private let windSpeedView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Constants.cellsBackgroundColor
        setupSubviewUI()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configue(with cityName: String, model: SearchViewModel){
        cityNameLabel.text = cityName
    }
}


private extension CityWeatherView {
    func setupSubviewUI(){
        backgroundColor = Constants.backgroundSubviewsColor
        
        setupCityNameLabel()
    }
    
    
    func setupCityNameLabel(){
        addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 32)
        cityNameLabel.textColor = Constants.textColorInCell
        cityNameLabel.text = "-"
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityNameLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 48)
        ])
    }
}
