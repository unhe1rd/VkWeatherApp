//
//  WeatherViewHeader.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 23.03.2024.
//

import UIKit


class WeatherViewHeader: UIView {
    private let cityLabel = UILabel()
    private let myLocationLabel = UILabel()
    private let scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.backgroundColor
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: WeatherHeaderModel){
        
    }
    
    func getCity(with city: String){
        cityLabel.text = "\(city)"
    }
}

private extension WeatherViewHeader {
    func setupUI(){
        setupCityLabel()
        setupMyLocationLabel()
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
            myLocationLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 16),
            myLocationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    func setupScrollView(){
        
    }
}
