//
//  TableViewCells.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 23.03.2024.
//

import UIKit

final class TableViewCell: UITableViewCell {
    private let dayLabel = UILabel()
    private let weatherImage = UIImageView()
    private let tempetatureLabel = UILabel()
    private let progressBar = UIProgressView()
    private let maxTempetatureLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
        print(#function)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with model: WeatherViewModel){
        print(#function)
    }
}

private extension TableViewCell {
    func setupCell(){
        backgroundColor = Constants.cellsBackgroundColor
        
        setupDayLabel()
//        setupWeatherImage()
//        setupTempetatureLabel()
//        setupProgressBar()
//        setupMaxTempetatureLabel()
    }
    
    
    func setupDayLabel(){
        addSubview(dayLabel)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .left
        dayLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        dayLabel.textColor = Constants.textColorInCell
        
        dayLabel.text = "Friday"
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    func setupWeatherImage(){
        addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.tintColor = Constants.imageColor
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.clipsToBounds = false
        
        weatherImage.image = UIImage(systemName: "cloud.fill")
        
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: topAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 8),
//            weatherImage.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>)
        ])
    }
    
    
    func setupTempetatureLabel(){
        addSubview(tempetatureLabel)
        tempetatureLabel.translatesAutoresizingMaskIntoConstraints = false
        tempetatureLabel.textAlignment = .left
        tempetatureLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        tempetatureLabel.textColor = Constants.textColor
        
        NSLayoutConstraint.activate([
            tempetatureLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 8),
            tempetatureLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    
    func setupProgressBar(){
        addSubview(progressBar)
        progressBar.progress = 0.5
        progressBar.progressTintColor = Constants.progressColor
        
        NSLayoutConstraint.activate([
            progressBar.leadingAnchor.constraint(equalTo: tempetatureLabel.trailingAnchor, constant: 8),
            progressBar.widthAnchor.constraint(equalToConstant: 100),
            progressBar.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    
    func setupMaxTempetatureLabel(){
        addSubview(maxTempetatureLabel)
        maxTempetatureLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempetatureLabel.textAlignment = .left
        maxTempetatureLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        maxTempetatureLabel.textColor = Constants.textColor
        
        NSLayoutConstraint.activate([
            maxTempetatureLabel.leadingAnchor.constraint(equalTo: progressBar.trailingAnchor, constant: 8),
            maxTempetatureLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}
