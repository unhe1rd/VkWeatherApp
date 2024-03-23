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
    private let cityLabel = UILabel()
    
    
    
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
        
        setupCityLabel()
        setupTableView()
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
    
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layer.cornerRadius = 16
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
    }
}


extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewHeight = tableView.bounds.height - tableView.sectionHeaderHeight
        
        return tableViewHeight / 8
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
        return 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = Constants.cellsBackgroundColor // Задайте цвет фона для заголовка
        
        let titleLabel = UILabel()
        titleLabel.text = "Заголовок таблицы" // Установите текст заголовка
        titleLabel.textColor = Constants.textColorInCell
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8),
        ])
        
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
        if locations.last != nil {
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


//Setup View by Presenter
extension WeatherViewController: WeatherViewInput {
    func configure(with model: WeatherViewModel) {
    }
}
