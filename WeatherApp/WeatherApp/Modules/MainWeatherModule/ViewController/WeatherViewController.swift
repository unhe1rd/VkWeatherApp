//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 21.03.2024.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    //ViewController Properties
    let output: WeatherViewOutput
    var model: WeatherViewModel?
    
    private let cityLabel = UILabel()
    private let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() // Запрос разрешения на использование геолокации во время использования приложения
        locationManager.startUpdatingLocation() // Начать обновление геолокации
        setupUI()
    }
    
    init(output: WeatherViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

extension WeatherViewController {
    // Метод делегата CLLocationManager, который вызывается при успешном обновлении геолокации
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            // Используйте полученную геолокацию здесь
        }
    }
    
    // Метод делегата CLLocationManager, который вызывается при изменении статуса разрешения на использование геолокации
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation() // Начать обновление геолокации, если разрешение предоставлено
        }
    }
}

