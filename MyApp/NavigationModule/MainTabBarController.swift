//
//  MainTabBarController.swift
//  MyApp
//
//  Created by Андрей Абакумов on 23.02.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let statisticVC = StatisticViewController()
        let userProfileVC = ProfileViewController()
        
        setViewControllers([mainVC, statisticVC, userProfileVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        items[0].image = UIImage(named: "mainTabBar")
        items[1].image = UIImage(named: "statisticTabBar")
        items[2].image = UIImage(named: "profileTabBar")
        
        UITabBarItem.appearance().setTitleTextAttributes(
            [.font : UIFont(name: "Roboto-Bold", size: 12) as Any],
            for: .normal
        )
    }
}
