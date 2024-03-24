//
//  WeatherViewHeader.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 23.03.2024.
//

import UIKit


final class WeatherViewHeader: UIViewController {
    weak var delegate: WeatherViewDelegate?
    private let cityLabel = UILabel()
    let myLocationLabel = UILabel()
    let scrollView = UIScrollView()
    let scrollHeaderLabel = UILabel()
    let containerView = UIView()
    
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
    
    override func viewDidLoad() {
        setupUI()
    }
    
    
    func configure(with model: WeatherHeaderModel){
        scrollHeaderLabel.text = "Current weather"
        temperatureView.configue(with: model.temp , image: UIImage(systemName: "thermometer.medium")!)
        sunsetView.configue(with: model.sunset, image: UIImage(systemName: "sunset")!)
    }
    
    func configureFromTable(with model: WeatherCellModel){
        scrollHeaderLabel.text = "Weather on \(model.date)"
        temperatureView.configue(with: model.maxTemperature , image: UIImage(systemName: "thermometer.medium")!)
        sunsetView.configue(with: model.sunset, image: UIImage(systemName: "sunset")!)
    }
    
    func getCity(with city: String){
        cityLabel.text = "\(city)"
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if isBeingDismissed {
            delegate?.didCloseWeatherView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: containerView.bounds.width+350, height: containerView.bounds.height)
    }
}

private extension WeatherViewHeader {
    func setupUI(){
        setupCityLabel()
        setupMyLocationLabel()
        setupScrollView()
        setupScrollHeaderLabel()
        setupContainerView()
        
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
    
    
    func setupCityLabel(){
        view.addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: 32)
        cityLabel.textColor = Constants.textColor
        
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 48)
        ])
    }
    
    
    func setupMyLocationLabel(){
        view.addSubview(myLocationLabel)
        myLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        myLocationLabel.font = UIFont.systemFont(ofSize: 24)
        myLocationLabel.textColor = Constants.textColor
        myLocationLabel.text = "My Location (Today)"
        
        NSLayoutConstraint.activate([
            myLocationLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 4),
            myLocationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = Constants.backgroundSubviewsColor
        scrollView.layer.cornerRadius = 16
        scrollView.indicatorStyle = .black
        scrollView.horizontalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 10, bottom: 5, right: -10)
        let scrollViewHeight:CGFloat = 200
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.heightAnchor.constraint(equalToConstant: scrollViewHeight)
        ])
    }
    
    func setupScrollHeaderLabel(){
        view.addSubview(scrollHeaderLabel)
        scrollHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollHeaderLabel.font = UIFont.boldSystemFont(ofSize: 18)
        scrollHeaderLabel.textColor = Constants.textColorInSubviews
        
        
        NSLayoutConstraint.activate([
            scrollHeaderLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            scrollHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    func setupContainerView() {
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 500),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    
    func setupTemperatureView(){
        containerView.addSubview(temperatureView)
        temperatureView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            temperatureView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            temperatureView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    func setupSunsetView(){
        containerView.addSubview(sunsetView)
        sunsetView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunsetView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            sunsetView.leadingAnchor.constraint(equalTo: temperatureView.subImage.trailingAnchor, constant: 16),
            sunsetView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    func setupSunriseView(){
        containerView.addSubview(sunriseView)
        sunriseView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sunriseView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            sunriseView.leadingAnchor.constraint(equalTo: sunsetView.subImage.trailingAnchor, constant: 16),
            sunriseView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    func setupWindSpeed(){
        containerView.addSubview(windSpeed)
        windSpeed.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            windSpeed.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            windSpeed.leadingAnchor.constraint(equalTo: sunriseView.subImage.trailingAnchor, constant: 16),
            windSpeed.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    func setupWindDeg(){
        containerView.addSubview(windDeg)
        windDeg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            windDeg.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            windDeg.leadingAnchor.constraint(equalTo: windSpeed.subImage.trailingAnchor, constant: 16),
            windDeg.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    func setupWindGust(){
        containerView.addSubview(windGust)
        windGust.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            windGust.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            windGust.leadingAnchor.constraint(equalTo: windDeg.subImage.trailingAnchor, constant: 16),
            windGust.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    func setupVisibility(){
        scrollView.addSubview(visibility)
        visibility.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            visibility.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            visibility.leadingAnchor.constraint(equalTo: windGust.subImage.trailingAnchor, constant: 16),
            visibility.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    func setupUvi(){
        scrollView.addSubview(uvi)
        uvi.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            uvi.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            uvi.leadingAnchor.constraint(equalTo: visibility.subImage.trailingAnchor, constant: 16),
            uvi.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    func setupHumidity(){
        scrollView.addSubview(humidity)
        humidity.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            humidity.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            humidity.leadingAnchor.constraint(equalTo: uvi.subImage.trailingAnchor, constant: 16),
            humidity.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    func setupPressure(){
        scrollView.addSubview(pressure)
        pressure.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pressure.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 25),
            pressure.leadingAnchor.constraint(equalTo: humidity.subImage.trailingAnchor, constant: 16),
            pressure.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
}
