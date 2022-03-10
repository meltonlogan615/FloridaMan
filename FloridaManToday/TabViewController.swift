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
    let settingsTabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
    settingsTab.tabBarItem = settingsTabBarItem
    
    let nope = UINavigationController(rootViewController: NoFloridaManViewController())
    let nopeTabBarItem = UITabBarItem(title: "Nope", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
    nope.tabBarItem = nopeTabBarItem

    self.viewControllers = [tableTab, dateSearch, settingsTab, nope]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    self.tabBar.tintColor = .darkGray
    self.tabBar.backgroundColor = .systemGray4
  }
  
  
  
}

