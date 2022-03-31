//
//  SettingsRow.swift
//  FloridaManToday
//
//  Created by Logan Melton on 3/1/22.
//

import Foundation
import UIKit

class SettingsRow: UIView {
  
  let rowStack = UIStackView()
  let infoLabel = UILabel()

  let linkButton = UIButton(type: .custom)
  
  var property = String()
  var value = String()
  
  var fontSize = CGFloat(16)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsRow {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    backgroundColor = UIColor(named: "FM-Yellow")
    layer.cornerRadius = 8
    clipsToBounds = true
    
    rowStack.translatesAutoresizingMaskIntoConstraints = false
    
    infoLabel.translatesAutoresizingMaskIntoConstraints = false
    infoLabel.font = .preferredFont(forTextStyle: .body)
    infoLabel.isAccessibilityElement = true
    
    linkButton.translatesAutoresizingMaskIntoConstraints = false
    linkButton.configuration = .borderless()
    linkButton.configuration?.buttonSize = .large
    linkButton.tintColor = .label
    linkButton.isHidden = true
  }
  
  func layout() {
    heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    addSubview(rowStack)
    rowStack.addArrangedSubview(infoLabel)
    rowStack.addArrangedSubview(linkButton)
        
    NSLayoutConstraint.activate([
      infoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      linkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      linkButton.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
}
