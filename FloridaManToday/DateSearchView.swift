//
//  DateSearchView.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/28/22.
//

import Foundation
import UIKit


class DateSearchView: UIView {

  let picker = UIDatePicker()
  let searchButton = UIButton(type: .custom)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

}

extension DateSearchView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    picker.translatesAutoresizingMaskIntoConstraints = false
    picker.datePickerMode = .date
    picker.preferredDatePickerStyle = .wheels
    picker.timeZone = NSTimeZone.local
    picker.isUserInteractionEnabled = true
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    searchButton.configuration = .bordered()
    searchButton.configuration?.buttonSize = .large
    searchButton.tintColor = UIColor(named: "FM-Purple")
    searchButton.setTitle("Git'em", for: [])
  }
  
  func layout() {
    addSubview(picker)
    addSubview(searchButton)
    
    NSLayoutConstraint.activate([
      picker.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      picker.centerXAnchor.constraint(equalTo: centerXAnchor),
    ])
    
    NSLayoutConstraint.activate([
      searchButton.topAnchor.constraint(equalToSystemSpacingBelow: picker.bottomAnchor, multiplier: 2),
      searchButton.trailingAnchor.constraint(equalTo: picker.trailingAnchor)
    ])
  }
}



