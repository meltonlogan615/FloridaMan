//
//  SettingsLinkViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 3/4/22.
//

import Foundation
import UIKit
import WebKit

class SettingsLinkViewController: UIViewController, WKNavigationDelegate {
  
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

extension SettingsLinkViewController {
  func style() {
    navigationController?.navigationBar.isOpaque = true
    navigationController?.navigationBar.layer.opacity = 0.9
  }
}

extension SettingsLinkViewController {
  @objc private func presentShareSheet() {
    guard let url = URL(string: articleURL) else { return }
//    let shareSMS = "Shared via Florida Man Today"
    let shareSheetViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
    
    present(shareSheetViewController, animated: true, completion: nil)
  }
}
