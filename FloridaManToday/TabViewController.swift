//
//  TabViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/28/22.
//

import Foundation

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let tableTab = UINavigationController(rootViewController: ArticleTableViewController())
    let tableTabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
    tableTab.tabBarItem = tableTabBarItem
    
    let dateSearch = UINavigationController(rootViewController: DateSearchViewController())
    let dateSearchTabBarITem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
    dateSearch.tabBarItem = dateSearchTabBarITem
    
    let settingsTab = UINavigationController(rootViewController: SettingsViewController())
    let settingsTabBarItem = UITabBarItem(title: "Info", image: UIImage(systemName: "info.circle"), selectedImage: UIImage(systemName: "info.circle.fill"))
    settingsTab.tabBarItem = settingsTabBarItem
    
    self.viewControllers = [tableTab, dateSearch, settingsTab]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    self.tabBar.tintColor = .darkGray
  }
}

