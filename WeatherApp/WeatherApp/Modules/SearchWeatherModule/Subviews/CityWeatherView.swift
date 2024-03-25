//
//  SearchSubview.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import UIKit

final class CityWeatherView: UIView {
    
    private let cityNameLabel = UILabel()
    private let dateLabel = UILabel()
    private var weatherImage = UIImageView()
    
    private let temperatureView = CitySubview()
    private let windSpeedView = CitySubview()
    private let sunriseView = CitySubview()
    private let sunsetView = CitySubview()
    private let pressureView = CitySubview()
    private let humidityView = CitySubview()

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
        
        temperatureView.configue(with: model.temp , image: UIImage(systemName: "thermometer.medium")!)
        sunsetView.configue(with: model.sunset, image: UIImage(systemName: "sunset")!)
        sunriseView.configue(with: model.sunrise, image: UIImage(systemName: "sunrise")!)
        windSpeedView.configue(with: model.windSpeed, image: UIImage(systemName: "wind")!)
        humidityView.configue(with: model.humidity, image: UIImage(systemName: "humidity")!)
        pressureView.configue(with: model.pressure, image: UIImage(systemName: "gauge")!)
    }
}


private extension CityWeatherView {
    func setupSubviewUI(){
        backgroundColor = Constants.backgroundSubviewsColor
        
        setupCityNameLabel()
        setupDateLabel()
        setupWeatherImage()
        setupTemperatureView()
        setupWindSpeedView()
        setupSunriseView()
        setupSunsetView()
        setupPressureView()
        setupHumidityView()
    }
    
    
    func setupCityNameLabel(){
        addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 32)
        cityNameLabel.textColor = Constants.textColorInSubviews
        cityNameLabel.text = "-"
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            cityNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cityNameLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 66)
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
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
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
            weatherImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weatherImage.widthAnchor.constraint(equalToConstant: imageSize),
            weatherImage.heightAnchor.constraint(equalToConstant: imageSize),
            weatherImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func setupTemperatureView(){
        addSubview(temperatureView)
        temperatureView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureView.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 32),
            temperatureView.leadingAnchor.constraint(equalTo: leadingAnchor),
            temperatureView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func setupWindSpeedView(){
        addSubview(windSpeedView)
        windSpeedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            windSpeedView.topAnchor.constraint(equalTo: temperatureView.bottomAnchor, constant: 48),
            windSpeedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            windSpeedView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupSunriseView(){
        addSubview(sunriseView)
        sunriseView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunriseView.topAnchor.constraint(equalTo: windSpeedView.bottomAnchor, constant: 48),
            sunriseView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sunriseView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupSunsetView(){
        addSubview(sunsetView)
        sunsetView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunsetView.topAnchor.constraint(equalTo: sunriseView.bottomAnchor, constant: 48),
            sunsetView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sunsetView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupPressureView(){
        addSubview(pressureView)
        pressureView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pressureView.topAnchor.constraint(equalTo: sunsetView.bottomAnchor, constant: 48),
            pressureView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pressureView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupHumidityView(){
        addSubview(humidityView)
        humidityView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            humidityView.topAnchor.constraint(equalTo: pressureView.bottomAnchor, constant: 48),
            humidityView.leadingAnchor.constraint(equalTo: leadingAnchor),
            humidityView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
