//
//  AppDelegate.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/17/22.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    let tabViewController = TabViewController()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = K.blue
    window?.rootViewController = tabViewController
    return true
  }
}
