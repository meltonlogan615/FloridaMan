//
//  ArticleViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/21/22.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController, WKNavigationDelegate {
  
  var webView: WKWebView!
  var articleURL = String()
  let preferences = WKWebpagePreferences()
  
  let navAppearance = UINavigationBarAppearance()
  let tabAppearance = UITabBarAppearance()
  
  override func loadView() {
    webView = WKWebView()
    webView.navigationDelegate = self
    view = webView
    view.backgroundColor = K.blue
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
//    navAppearance.backgroundColor = K.blue
//    navigationController?.navigationBar.tintColor = .label
//    navigationController?.navigationBar.standardAppearance = navAppearance
//    navigationController?.navigationBar.compactAppearance = navAppearance
//    navigationController?.navigationBar.scrollEdgeAppearance = navAppearance
//
//    tabAppearance.backgroundColor = K.blue
//    tabBarController?.tabBar.standardAppearance = tabAppearance
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let url = URL(string: articleURL) else { return }
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(presentShareSheet))
    
    navAppearance.backgroundColor = K.blue
    navigationController?.navigationBar.tintColor = .label
    navigationController?.navigationBar.standardAppearance = navAppearance
    navigationController?.navigationBar.compactAppearance = navAppearance
    navigationController?.navigationBar.scrollEdgeAppearance = navAppearance
    tabAppearance.backgroundColor = K.blue
    tabBarController?.tabBar.standardAppearance = tabAppearance
    
    webView.load(URLRequest(url: url))
    webView.allowsBackForwardNavigationGestures = true
  }
}

extension ArticleViewController {
  @objc private func presentShareSheet() {
    guard let url = URL(string: articleURL) else { return }
    let shareSMS = "Shared via Florida Man Today"
    let linebreak = "\n"
    let shareSheetViewController = UIActivityViewController(activityItems: [shareSMS, linebreak, url], applicationActivities: nil)
    
    present(shareSheetViewController, animated: true, completion: nil)
  }
}



