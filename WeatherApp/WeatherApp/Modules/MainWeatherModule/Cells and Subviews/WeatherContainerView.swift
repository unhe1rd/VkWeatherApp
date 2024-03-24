//
//  WeatherContainerView.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import UIKit

final class WeatherContainerView: UIView {
    private let temperatureView = ScrollSubview()
    private let sunsetView = ScrollSubview()
    private let sunriseView = ScrollSubview()
    private let windSpeed = ScrollSubview()
    private let windDeg = ScrollSubview()
    private let windGust = ScrollSubview()
    private let visibility = ScrollSubview()
    private let uvi = ScrollSubview()
    private let humidity = ScrollSubview()
    private let pressure = ScrollSubview()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.cellsBackgroundColor
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with model: WeatherHeaderModel){
        temperatureView.configue(with: model.temp , image: UIImage(systemName: "thermometer.medium")!)
        sunsetView.configue(with: model.sunset, image: UIImage(systemName: "sunset")!)
    }
}

private extension WeatherContainerView{
    func setupCell(){
        setupTemperatureView()
        setupSunsetView()
        setupSunriseView()
        setupWindSpeed()
        setupWindDeg()
        setupWindGust()
        setupVisibility()
        setupUvi()
        setupHumidity()
        setupPressure()
    }
    
    func setupTemperatureView(){
        addSubview(temperatureView)
        temperatureView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            temperatureView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            temperatureView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupSunsetView(){
        addSubview(sunsetView)
        sunsetView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunsetView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            sunsetView.leadingAnchor.constraint(equalTo: temperatureView.subImage.trailingAnchor, constant: 16),
            sunsetView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupSunriseView(){
        addSubview(sunriseView)
        sunriseView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunriseView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            sunriseView.leadingAnchor.constraint(equalTo: sunsetView.subImage.trailingAnchor, constant: 16),
            sunriseView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupWindSpeed(){
        addSubview(windSpeed)
        windSpeed.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            windSpeed.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            windSpeed.leadingAnchor.constraint(equalTo: sunriseView.subImage.trailingAnchor, constant: 16),
            windSpeed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupWindDeg(){
        addSubview(windDeg)
        windDeg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            windDeg.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            windDeg.leadingAnchor.constraint(equalTo: windSpeed.subImage.trailingAnchor, constant: 16),
            windDeg.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    func setupWindGust(){
        addSubview(windGust)
        windGust.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            windGust.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            windGust.leadingAnchor.constraint(equalTo: windDeg.subImage.trailingAnchor, constant: 16),
            windGust.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    func setupVisibility(){
        addSubview(visibility)
        visibility.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            visibility.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            visibility.leadingAnchor.constraint(equalTo: windGust.subImage.trailingAnchor, constant: 16),
            visibility.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    func setupUvi(){
        addSubview(uvi)
        uvi.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            uvi.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            uvi.leadingAnchor.constraint(equalTo: visibility.subImage.trailingAnchor, constant: 16),
            uvi.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    func setupHumidity(){
        addSubview(humidity)
        humidity.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            humidity.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            humidity.leadingAnchor.constraint(equalTo: uvi.subImage.trailingAnchor, constant: 16),
            humidity.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    func setupPressure(){
        addSubview(pressure)
        pressure.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pressure.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            pressure.leadingAnchor.constraint(equalTo: humidity.subImage.trailingAnchor, constant: 16),
            pressure.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
