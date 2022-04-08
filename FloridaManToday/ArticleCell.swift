//
//  ArticleCell.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/17/22.
//

import Foundation
import UIKit

class ArticleCell: UITableViewCell {
  
  
  let cellStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 4
    return stack
  }()
  
  let labelStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .horizontal
    stack.spacing = 4
    return stack
  }()
  
  var articleGlyph: UIImageView = {
    let glyph = UIImageView()
    glyph.tintColor = UIColor.label
    return glyph
  }()
  
  var headlineLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .title3)
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()
  
  var sourceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .footnote)
    label.numberOfLines = 1
    return label
  }()
  
  var dateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: .footnote)
    label.numberOfLines = 1
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.isAccessibilityElement = true
    
    backgroundColor = K.yellow
    labelStack.addArrangedSubview(dateLabel)
    labelStack.addArrangedSubview(sourceLabel)
    
    cellStack.addArrangedSubview(headlineLabel)
    cellStack.addArrangedSubview(labelStack)
        
    self.contentView.addSubview(cellStack)
    
    NSLayoutConstraint.activate([
      
      cellStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: cellStack.trailingAnchor, multiplier: 1),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: cellStack.bottomAnchor, multiplier: 1),
      cellStack.leadingAnchor.constraint(equalToSystemSpacingAfter: self.contentView.leadingAnchor, multiplier: 2)
    ])
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


