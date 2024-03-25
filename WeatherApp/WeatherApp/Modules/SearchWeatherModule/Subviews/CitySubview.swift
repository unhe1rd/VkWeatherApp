//
//  CitySubview.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import UIKit

final class CitySubview: UIView {
    let label = UILabel()
    let subImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Constants.cellsBackgroundColor
        setupSubviewUI()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configue(with labelText: String, image: UIImage){
        subImage.image = image
        label.text = labelText
    }
}


private extension CitySubview {
    func setupSubviewUI(){
        setupImage()
        setupLabel()
    }
    
    
    func setupImage(){
        addSubview(subImage)
        subImage.translatesAutoresizingMaskIntoConstraints = false
        subImage.image = UIImage(systemName: "exclamationmark.icloud")
        subImage.tintColor = .black
        subImage.contentMode = .scaleAspectFit
        subImage.clipsToBounds = false
        let subImageSize: CGFloat = 50
        NSLayoutConstraint.activate([
            subImage.topAnchor.constraint(equalTo: topAnchor),
            subImage.heightAnchor.constraint(equalToConstant: subImageSize),
            subImage.widthAnchor.constraint(equalToConstant: subImageSize),
            subImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    func setupLabel(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = Constants.textColorInSubviews
        label.textAlignment = .center
        label.text = "-"
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            label.leadingAnchor.constraint(equalTo: subImage.leadingAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: topAnchor, constant: 100)
        ])
    }
}
