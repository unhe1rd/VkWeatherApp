//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 21.03.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    //ViewController Properties
    private let cityLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
}

private extension WeatherViewController {
    func setupUI(){
        view.backgroundColor = Constants.backgroundColor
        
        setupCityLabel()
    }
    
    
    func setupCityLabel(){
        view.addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.text = "Moscow"
        cityLabel.font = UIFont.systemFont(ofSize: 32)
        cityLabel.textColor = Constants.textColor
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}

