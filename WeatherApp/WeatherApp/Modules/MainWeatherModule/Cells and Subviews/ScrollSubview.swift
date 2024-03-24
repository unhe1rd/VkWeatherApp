//
//  ScrollSubview.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 24.03.2024.
//

import UIKit


final class ScrollSubview: UIView {
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
        label.text = labelText
        subImage.image = image
    }
}


private extension ScrollSubview {
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
        
        NSLayoutConstraint.activate([
            subImage.topAnchor.constraint(equalTo: topAnchor),
            subImage.heightAnchor.constraint(equalToConstant: 30),
            subImage.widthAnchor.constraint(equalToConstant: 30),
            subImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    
    func setupLabel(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = Constants.textColorInSubviews
        label.text = "123"
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: subImage.bottomAnchor, constant: 4),
            label.centerXAnchor.constraint(equalTo: subImage.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: topAnchor, constant: 48)
        ])
    }
}
