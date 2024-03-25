//
//  TabBar.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 21.03.2024.
//

import UIKit
import SwiftUI

final class TabBarController: UITabBarController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabs()
    
    }
}

private extension TabBarController {
    
    func setupTabBar() {
        tabBar.tintColor = Constants.tabBarTintColor
        tabBar.barTintColor = Constants.barTintColor
    }
    
    
    func setupTabs() {
        let faqVC = UIHostingController(rootView: FaqView())
        faqVC.tabBarItem.image = UIImage(systemName: "questionmark.circle.fill")!
        
        let mainVC = WeatherAssembly.assembly()
        mainVC.tabBarItem.image = UIImage(systemName: "smoke.fill")
        
        let searchVC = SearchAssembly.assembly()
        searchVC.tabBarItem.image = UIImage(systemName: "location.magnifyingglass")
        
        viewControllers = [faqVC, mainVC, searchVC]
    }
    
}
