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
        setupWeatherImage()
        setupTempetatureLabel()
        setupProgressBar()
        setupMaxTempetatureLabel()
    }
    
    
    func setupDayLabel(){
        addSubview(dayLabel)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .left
        dayLabel.font = .boldSystemFont(ofSize: 24)
        dayLabel.textColor = Constants.textColorInCell
        dayLabel.shadowColor = .lightGray
        dayLabel.text = "Fri"
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dayLabel.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 108),
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    func setupWeatherImage(){
        addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.tintColor = Constants.imageColor
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.clipsToBounds = false
        weatherImage.image = UIImage(systemName: "cloud")
        
        let imageSize:CGFloat = frame.height * 0.8
        NSLayoutConstraint.activate([
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 8),
            weatherImage.widthAnchor.constraint(equalToConstant: imageSize),
            weatherImage.heightAnchor.constraint(equalToConstant: imageSize)
        ])
    }
    
    
    func setupTempetatureLabel(){
        addSubview(tempetatureLabel)
        tempetatureLabel.translatesAutoresizingMaskIntoConstraints = false
        tempetatureLabel.textAlignment = .left
        tempetatureLabel.font = .systemFont(ofSize: 24)
        tempetatureLabel.textColor = Constants.textColorInCell
        
        tempetatureLabel.text = "1°"
        
        NSLayoutConstraint.activate([
            tempetatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            tempetatureLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 16)
        ])
    }
    
    
    func setupProgressBar(){
        addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        progressBar.progress = 0.5
        progressBar.progressTintColor = Constants.progressColor
        progressBar.layer.cornerRadius = 1
        
        NSLayoutConstraint.activate([
            progressBar.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: tempetatureLabel.trailingAnchor, constant: 8),
            progressBar.trailingAnchor.constraint(equalTo: tempetatureLabel.trailingAnchor, constant: 108),
            progressBar.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    
    func setupMaxTempetatureLabel(){
        addSubview(maxTempetatureLabel)
        maxTempetatureLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempetatureLabel.textAlignment = .left
        maxTempetatureLabel.font = .systemFont(ofSize: 24)
        maxTempetatureLabel.textColor = Constants.textColorInCell
        
        maxTempetatureLabel.text = "5°"
        
        NSLayoutConstraint.activate([
            maxTempetatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            maxTempetatureLabel.leadingAnchor.constraint(equalTo: progressBar.trailingAnchor, constant: 8)
        ])
    }
}
