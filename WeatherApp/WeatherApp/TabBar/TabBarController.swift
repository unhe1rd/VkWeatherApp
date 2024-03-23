//
//  TabBar.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 21.03.2024.
//

import UIKit

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
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
    }
    
    
    func setupTabs() {

        let mainVC = WeatherAssembly.assembly()
        mainVC.tabBarItem.image = UIImage(systemName: "smoke.fill")
        
        let searchVC = WeatherAssembly.assembly()
        searchVC.tabBarItem.image = UIImage(systemName: "location.magnifyingglass")
        
        
        viewControllers = [mainVC, searchVC]
    }
    
}
