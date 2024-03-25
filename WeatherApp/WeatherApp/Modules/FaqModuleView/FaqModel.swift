//
//  FaqModel.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import SwiftUI

struct FaqModel: Identifiable {
    var id = UUID().uuidString
    var imageName: String
    var description: String
}

var faqModel = [
    FaqModel(imageName: "thermometer.medium", description: ": Weather temperature in C°"),
    FaqModel(imageName: "sunset", description: ": Sunset time"),
    FaqModel(imageName: "sunrise", description: ": Sunrise time"),
    FaqModel(imageName: "moonrise", description: ": Moonrise time"),
    FaqModel(imageName: "wind", description: ": Wind speed"),
    FaqModel(imageName: "eye", description: ": Visibility range in kilometers"),
    FaqModel(imageName: "sun.dust", description: ": Ultraviolet index"),
    FaqModel(imageName: "humidity", description: ": Humidity, %"),
    FaqModel(imageName: "gauge", description: ": Atmospheric pressure, hPa"),
]
