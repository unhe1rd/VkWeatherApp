//
//  WeatherViewHeader.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 23.03.2024.
//

import UIKit


class WeatherViewHeader: UIView {
    private let cityLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.backgroundColor
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension WeatherViewHeader {
    func setupUI(){
        setupCityLabel()
    }
    
    
    func setupCityLabel(){
        print(#function)
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityLabel.text = "Moscow"
        cityLabel.font = UIFont.systemFont(ofSize: 32)
        cityLabel.textColor = Constants.textColor
        
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityLabel.heightAnchor.constraint(equalToConstant: 24),
            cityLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
    }
}
