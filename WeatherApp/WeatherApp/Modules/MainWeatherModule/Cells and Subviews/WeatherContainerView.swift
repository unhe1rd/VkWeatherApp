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
    private let windSpeedView = ScrollSubview()
    private let visibilityView = ScrollSubview()
    private let uviView = ScrollSubview()
    private let humidityView = ScrollSubview()
    private let pressureView = ScrollSubview()

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
        sunriseView.configue(with: model.sunrise, image: UIImage(systemName: "sunrise")!)
        windSpeedView.configue(with: model.wind_speed, image: UIImage(systemName: "wind")!)
        visibilityView.configue(with: model.visibility, image: UIImage(systemName: "eye")!)
        uviView.configue(with: model.uvi, image: UIImage(systemName: "sun.dust")!)
        humidityView.configue(with: model.humidity, image: UIImage(systemName: "humidity")!)
        pressureView.configue(with: model.pressure, image: UIImage(systemName: "gauge")!)
    }
    
    
    func configureFromTable(with model: WeatherCellModel){
        temperatureView.configue(with: model.maxTemperature , image: UIImage(systemName: "thermometer.medium")!)
        sunsetView.configue(with: model.sunset, image: UIImage(systemName: "sunset")!)
        sunriseView.configue(with: model.sunrise, image: UIImage(systemName: "sunrise")!)
        windSpeedView.configue(with: model.wind_speed, image: UIImage(systemName: "wind")!)
        visibilityView.configue(with: model.moonrise, image: UIImage(systemName: "moonrise")!)
        uviView.configue(with: model.uvi, image: UIImage(systemName: "sun.dust")!)
        humidityView.configue(with: model.humidity, image: UIImage(systemName: "humidity")!)
        pressureView.configue(with: model.pressure, image: UIImage(systemName: "gauge")!)
    }
}

private extension WeatherContainerView{
    func setupCell(){
        setupTemperatureView()
        setupSunsetView()
        setupSunriseView()
        setupWindSpeedView()
        setupVisibilityView()
        setupUviView()
        setupHumidityView()
        setupPressureView()
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
            sunsetView.leadingAnchor.constraint(equalTo: temperatureView.label.trailingAnchor, constant: 16),
            sunsetView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupSunriseView(){
        addSubview(sunriseView)
        sunriseView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunriseView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            sunriseView.leadingAnchor.constraint(equalTo: sunsetView.label.trailingAnchor, constant: 16),
            sunriseView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupWindSpeedView(){
        addSubview(windSpeedView)
        windSpeedView.translatesAutoresizingMaskIntoConstraints = false
        windSpeedView.label.textAlignment = .center
        NSLayoutConstraint.activate([
            windSpeedView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            windSpeedView.leadingAnchor.constraint(equalTo: sunriseView.label.trailingAnchor, constant: 16),
            windSpeedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupVisibilityView(){
        addSubview(visibilityView)
        visibilityView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            visibilityView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            visibilityView.leadingAnchor.constraint(equalTo: windSpeedView.label.trailingAnchor, constant: 16),
            visibilityView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    func setupUviView(){
        addSubview(uviView)
        uviView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            uviView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            uviView.leadingAnchor.constraint(equalTo: visibilityView.label.trailingAnchor, constant: 16),
            uviView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    func setupHumidityView(){
        addSubview(humidityView)
        humidityView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            humidityView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            humidityView.leadingAnchor.constraint(equalTo: uviView.label.trailingAnchor, constant: 16),
            humidityView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    func setupPressureView(){
        addSubview(pressureView)
        pressureView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pressureView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            pressureView.leadingAnchor.constraint(equalTo: humidityView.label.trailingAnchor, constant: 16),
            pressureView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
