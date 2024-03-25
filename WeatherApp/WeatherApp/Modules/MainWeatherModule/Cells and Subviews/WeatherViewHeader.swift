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
    let containerView = WeatherContainerView()
    
    override func viewDidLoad() {
        setupUI()
    }
    
    
    func configure(with model: WeatherHeaderModel){
        scrollHeaderLabel.text = "Current weather"
        containerView.configure(with: model)
        
    }
    
    func configureFromTable(with model: WeatherCellModel){
        scrollHeaderLabel.text = "Weather on \(model.date)"
        containerView.configureFromTable(with: model)
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
            scrollView.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
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
}
