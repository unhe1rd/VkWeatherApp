//
//  Assembly.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import Foundation
import UIKit

final class SearchAssembly {
    static func assembly(moduleOutput: SearchModuleOutput? = nil) -> UIViewController {
        let presenter = SearchPresenter()
        let viewController = SearchViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
}
