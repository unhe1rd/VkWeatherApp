//
//  TableViewHeaderCell.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 23.03.2024.
//

import UIKit

final class TableViewHeaderCell: UIView {
    let titleLabel = UILabel()
    let titleImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.cellsBackgroundColor
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TableViewHeaderCell{
    func setupCell(){
        setupTitleImage()
        setupTitleLabel()
    }
    
    
    func setupTitleLabel(){
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "7-DAY FORECAST"
        titleLabel.textColor = Constants.textColorInCell
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 8),

        ])
    }
    
    
    func setupTitleImage(){
        addSubview(titleImage)
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.image = UIImage(systemName: "calendar")
        titleImage.tintColor = .black
        titleImage.contentMode = .scaleAspectFit
        titleImage.clipsToBounds = false
        
        NSLayoutConstraint.activate([
            titleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleImage.heightAnchor.constraint(equalToConstant: 30),
            titleImage.widthAnchor.constraint(equalToConstant: 30),
            titleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
