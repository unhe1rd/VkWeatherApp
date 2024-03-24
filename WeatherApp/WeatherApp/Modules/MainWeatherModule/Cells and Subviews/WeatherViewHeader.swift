//
//  WeatherViewHeader.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 23.03.2024.
//

import UIKit


final class WeatherViewHeader: UIView {
    private let cityLabel = UILabel()
    private let myLocationLabel = UILabel()
    private let scrollView = UIScrollView()
    private let temperatureView = ScrollSubview()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.backgroundColor
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: WeatherHeaderModel){
        temperatureView.configue(with: model.temp , image: UIImage(systemName: "thermometer.medium")!)
    }
    
    func getCity(with city: String){
        cityLabel.text = "\(city)"
    }
}

private extension WeatherViewHeader {
    func setupUI(){
        setupCityLabel()
        setupMyLocationLabel()
        setupScrollView()
        setupTemperatureView()
    }
    
    
    func setupCityLabel(){
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: 32)
        cityLabel.textColor = Constants.textColor
        
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 48)
        ])
    }
    
    
    func setupMyLocationLabel(){
        addSubview(myLocationLabel)
        myLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        myLocationLabel.font = UIFont.systemFont(ofSize: 24)
        myLocationLabel.textColor = Constants.textColor
        myLocationLabel.text = "My Location (Today)"
        
        NSLayoutConstraint.activate([
            myLocationLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 4),
            myLocationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    func setupScrollView(){
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = Constants.backgroundSubviewsColor
        scrollView.layer.cornerRadius = 16
        let scrollViewHeight:CGFloat = 200
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor, constant: 16),
            scrollView.heightAnchor.constraint(equalToConstant: scrollViewHeight),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    
    func setupTemperatureView(){
        scrollView.addSubview(temperatureView)
        temperatureView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            temperatureView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            temperatureView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8)
        ])
        
    }
}
