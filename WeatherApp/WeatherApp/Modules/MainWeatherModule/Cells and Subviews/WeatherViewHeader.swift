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
    private let temperatureView = ScrollSubview()
    
    override func viewDidLoad() {
        setupUI()
    }
    
    
    func configure(with model: WeatherHeaderModel){
        temperatureView.configue(with: model.temp , image: UIImage(systemName: "thermometer.medium")!)
    }
    
    func configureFromTable(with model: WeatherCellModel){
        temperatureView.configue(with: model.maxTemperature , image: UIImage(systemName: "thermometer.medium")!)
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
}

private extension WeatherViewHeader {
    func setupUI(){
        setupCityLabel()
        setupMyLocationLabel()
        setupScrollView()
        setupScrollHeaderLabel()
        setupTemperatureView()
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
        let scrollViewHeight:CGFloat = 200
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor, constant: 16),
            scrollView.heightAnchor.constraint(equalToConstant: scrollViewHeight),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    
    func setupScrollHeaderLabel(){
        view.addSubview(scrollHeaderLabel)
        scrollHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollHeaderLabel.font = UIFont.boldSystemFont(ofSize: 18)
        scrollHeaderLabel.textColor = Constants.textColorInSubviews
        scrollHeaderLabel.text = "Current weather"
        
        NSLayoutConstraint.activate([
            scrollHeaderLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            scrollHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setupTemperatureView(){
        scrollView.addSubview(temperatureView)
        temperatureView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 25),
            temperatureView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            temperatureView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8)
        ])
        
    }
}
