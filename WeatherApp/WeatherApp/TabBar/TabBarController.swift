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
    
//    func generateVC(viewController: UIViewController, title: String) -> UIViewController {
//        viewController.tabBarItem.title = title
//        
//        return viewController
//    }
    
    func setupTabBar() {
        view.backgroundColor = .lightGray
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
    }
    
    
    func setupTabs() {

        let mainVC = WeatherViewController()
        mainVC.tabBarItem.image = UIImage(systemName: "smoke.fill")
        
        let searchVC = WeatherViewController()
        searchVC.tabBarItem.image = UIImage(systemName: "location.magnifyingglass")
        
        
        viewControllers = [mainVC, searchVC]
    }
    
}
