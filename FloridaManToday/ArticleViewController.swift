//
//  ArticleViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/21/22.
//

import Foundation
import UIKit
import WebKit

class ArticleViewController: UIViewController, WKNavigationDelegate {
  
  var webView: WKWebView!
  var articleURL = String()
    
  override func loadView() {
    webView = WKWebView()
    webView.navigationDelegate = self
    view = webView
    
    view.backgroundColor = .systemGray5
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let url = URL(string: articleURL) else { return }
    webView.load(URLRequest(url: url))
    webView.allowsBackForwardNavigationGestures = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(presentShareSheet))
    
    style()
  }
}

extension ArticleViewController {
  func style() {
    navigationController?.navigationBar.tintColor = UIColor(named: "FM-Blue")
    navigationController?.navigationBar.isOpaque = false
    navigationController?.navigationBar.backgroundColor = view.backgroundColor
//    webView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1).isActive = true
  }
}

extension ArticleViewController {
  @objc private func presentShareSheet() {
    guard let url = URL(string: articleURL) else { return }
    let shareSMS = "Shared via Florida Man Today"
    let linebreak = " "
    let shareSheetViewController = UIActivityViewController(activityItems: [shareSMS, linebreak, url], applicationActivities: nil)
    
    present(shareSheetViewController, animated: true, completion: nil)
  }
}


