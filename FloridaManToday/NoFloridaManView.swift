//
//  NoFloridaManView.swift
//  FloridaManToday
//
//  Created by Logan Melton on 3/9/22.
//

import Foundation
import UIKit

class NoFloridaManView: UIView {
  
  let stack = UIStackView()
  let headline = UILabel()
  let image = UIImageView()
  let descriptionLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension NoFloridaManView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 32
    
    headline.translatesAutoresizingMaskIntoConstraints = false
    headline.font = .preferredFont(forTextStyle: .title1)
    headline.text = "No Florida Man Today"
    headline.textAlignment = .center
    
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "fm1")?.withTintColor(UIColor(named: "FM-Purple")!)
    image.tintColor = .label
    
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.font = .preferredFont(forTextStyle: .body)
    descriptionLabel.text = "Check again tomorrow"
    descriptionLabel.textAlignment = .center
  }
  
  func layout() {
    stack.addArrangedSubview(headline)
    stack.addArrangedSubview(image)
    stack.addArrangedSubview(descriptionLabel)
    
    addSubview(stack)
    
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: topAnchor),
      stack.trailingAnchor.constraint(equalTo: trailingAnchor),
      stack.bottomAnchor.constraint(equalTo: bottomAnchor),
      stack.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
    
  }
}
