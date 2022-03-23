//
//  SettingsLabelRow.swift
//  FloridaManToday
//
//  Created by Logan Melton on 3/4/22.
//

import Foundation
import UIKit

class SettingsLabelRow: UIView {
  
  let label = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsLabelRow {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.textColor = .label
    label.textAlignment = .natural
  }
  
  func layout() {
    heightAnchor.constraint(equalToConstant: 24).isActive = true
    
    addSubview(label)
    NSLayoutConstraint.activate([
      label.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
}
