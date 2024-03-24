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
    private var weatherModel: WeatherViewModel?
    private var weatherCellModel: [WeatherCellModel] = []
    private let locationManager: CLLocationManager = CLLocationManager()
    private let tableView = UITableView()
    private let weatherViewHeader = WeatherViewHeader()
    private var blackOverlayView = UIView()
    
    
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
        view.addSubview(weatherViewHeader.view)
        weatherViewHeader.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherViewHeader.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherViewHeader.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherViewHeader.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupBlackOverlayView(){
        blackOverlayView = UIView(frame: self.view.bounds)
        blackOverlayView.backgroundColor = UIColor.black
        blackOverlayView.alpha = 0.5
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
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: weatherViewHeader.scrollView.bottomAnchor, constant: 16)
        ])
        
    }
}


extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewHeight = tableView.bounds.height - tableView.sectionHeaderHeight
        return tableViewHeight / CGFloat(weatherCellModel.count)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherCellModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configure(with: weatherCellModel[indexPath.row], id: indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableViewHeaderCell()
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Я нажал на \(indexPath.row)")
        
        let viewToPresent = WeatherViewHeader()
        viewToPresent.myLocationLabel.isHidden = true
        viewToPresent.delegate = self
        
        setupBlackOverlayView()
        
        view.addSubview(blackOverlayView)
        viewToPresent.modalPresentationStyle = .popover
        viewToPresent.configureFromTable(with: weatherCellModel[indexPath.row])
        present(viewToPresent, animated: true, completion: nil)
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
                    DispatchQueue.main.async {
                        self.weatherViewHeader.getCity(with: city)
                    }
                }
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
}


//Setup View by Presenter
extension WeatherViewController: WeatherViewInput {
    
    func configure(with model: WeatherViewModel) {
        self.weatherModel = model
        self.weatherCellModel = model.dailyWeather
        DispatchQueue.main.async {
            self.weatherViewHeader.configure(with: model.currentWeather)
            self.tableView.reloadData()
        }
    }
}

extension WeatherViewController: WeatherViewDelegate {
    func didCloseWeatherView() {
        blackOverlayView.removeFromSuperview()
    }
}
