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
    private let output: WeatherViewOutput
    private var weatherModel: [WeatherViewModel] = []
    private let locationManager: CLLocationManager = CLLocationManager()
    private let tableView = UITableView()
    private let weatherViewHeader = WeatherViewHeader()
    
    
    
    init(output: WeatherViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
        setupUI()
        
        output.didLoadView()
    }
}

private extension WeatherViewController {
    func setupUI(){
        view.backgroundColor = Constants.backgroundColor
        
        setupWeatherViewHeader()
        setupTableView()
    }

    func setupWeatherViewHeader(){
        view.addSubview(weatherViewHeader)
        weatherViewHeader.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherViewHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherViewHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherViewHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layer.cornerRadius = 16
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.showsVerticalScrollIndicator = false

        
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
    }
}


extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewHeight = tableView.bounds.height - tableView.sectionHeaderHeight
        return tableViewHeight / 8.7
    }
    
    // Реализуйте методы делегата и источника данных для вашего UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return model?.data.count ?? 0 // Замените эту строку на логику, возвращающую количество ячеек таблицы
        return 7
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
//        cell.configure(with: weatherModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableViewHeaderCell()
        return headerView
    }
}


extension WeatherViewController {
    func getLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        print(locationManager.location?.coordinate ?? "nil location")
    }
    
    // Метод делегата CLLocationManager, который вызывается при успешном обновлении геолокации
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            UserDefaults.standard.set(location.coordinate.latitude, forKey: "latitude")
            UserDefaults.standard.set(location.coordinate.longitude, forKey: "longitude")
            
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error {
                    print("Reverse geocoding failed with error: \(error.localizedDescription)")
                    return
                }
                
                if let placemark = placemarks?.first, let city = placemark.locality {
                    print("Город: \(city)")
                    self.weatherViewHeader.cityLabel.text = "\(city)"  
                }
            }
        }
    }
    
    // Метод делегата CLLocationManager, который вызывается при изменении статуса разрешения на использование геолокации
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation() // Начать обновление геолокации, если разрешение предоставлено
        }
    }
}


//Setup View by Presenter
extension WeatherViewController: WeatherViewInput {
    func configure(with model: WeatherViewModel) {
    }
}
