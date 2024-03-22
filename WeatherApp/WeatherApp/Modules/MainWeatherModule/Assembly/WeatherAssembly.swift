//
//  WeatherAssembly.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 22.03.2024.
//

import Foundation
import UIKit

final class WeatherAssembly {
    static func assembly(moduleOutput: WeatherModuleOutput? = nil) -> UIViewController {
        let presenter = WeatherPresenter()
        let viewController = WeatherViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
}
