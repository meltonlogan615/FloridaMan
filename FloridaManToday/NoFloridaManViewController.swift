//
//  NoFloridaManViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 3/9/22.
//

import UIKit

class NoFloridaManViewController: UIViewController {
  
  let nopeView = NoFloridaManView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(named: "FM-Blue")
    style()
    layout()
  }
  
  
}

extension NoFloridaManViewController {
  
  func style() {
    nopeView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(nopeView)
    
    NSLayoutConstraint.activate([
      nopeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nopeView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
