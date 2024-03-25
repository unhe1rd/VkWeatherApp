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
    
    private let cityNameLabel = UILabel()
    private let dateLabel = UILabel()
    private var weatherImage = UIImageView()
    
    private let temperatureView = CitySubview()
    private let windSpeedView = CitySubview()

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
        dateLabel.text = model.date
        weatherImage.image = model.weatherImage
    }
}


private extension CityWeatherView {
    func setupSubviewUI(){
        backgroundColor = Constants.backgroundSubviewsColor
        
        setupCityNameLabel()
        setupDateLabel()
        setupWeatherImage()
        setupTemperatureView()
    }
    
    
    func setupCityNameLabel(){
        addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 32)
        cityNameLabel.textColor = Constants.textColorInSubviews
        cityNameLabel.text = "-"
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityNameLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 48)
        ])
    }
    
    
    func setupDateLabel(){
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 24)
        dateLabel.textColor = Constants.textColorInSubviews
        dateLabel.text = "No data"
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 4),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupWeatherImage(){
        addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.image = UIImage(systemName: "exclamationmark.icloud.fill")
        weatherImage.tintColor = Constants.imageColor
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.clipsToBounds = false
        
        let imageSize:CGFloat = 30
        NSLayoutConstraint.activate([
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.widthAnchor.constraint(equalToConstant: imageSize),
            weatherImage.heightAnchor.constraint(equalToConstant: imageSize),
            weatherImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func setupTemperatureView(){
        addSubview(temperatureView)
        temperatureView.translatesAutoresizingMaskIntoConstraints = false
    }
}
