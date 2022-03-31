//
//  DateSearchViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/28/22.
//

import UIKit

protocol PassingDate {
  func getSelectedDateArticles(from articles: [Article])
}

class DateSearchViewController: UIViewController {
  
  let searchView = DateSearchView()
  
  let formatter = DateFormatter()
  let displayFormatter = DateFormatter()
  var selectedDate = String()
  var displayDate = String()
  var pickerDate = Date()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(named: "FM-Blue")
    self.title = "Search"
    navigationController?.navigationBar.prefersLargeTitles = true
    style()
    layout()
    configureButtons()
  }
  
  
}

extension DateSearchViewController {
  
  func style() {
    searchView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(searchView)
    NSLayoutConstraint.activate([
      searchView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
      searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      searchView.widthAnchor.constraint(equalTo: view.widthAnchor)
//      searchView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  }
  
  func configureButtons() {
    searchView.picker.addTarget(self, action: #selector(pickerValueChanged), for: .primaryActionTriggered)
    searchView.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .primaryActionTriggered)
  }
}

extension DateSearchViewController {
  @objc func pickerValueChanged(_ sender: UIDatePicker) {
    self.pickerDate = sender.date
    formatter.locale = Locale(identifier: "en_US")
    displayFormatter.locale = Locale(identifier: "en_US")
    formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
    displayFormatter.setLocalizedDateFormatFromTemplate("MMMdd")
    self.selectedDate = formatter.string(from: pickerDate)
    self.displayDate = displayFormatter.string(from: pickerDate)
  }
  
  @objc func searchButtonPressed(_ sender: UIButton) {
    let resutlsVC = DateSearchResultsTableView()
    if self.selectedDate == "" {
      formatter.locale = Locale(identifier: "en_US")
      formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
      self.selectedDate = formatter.string(from: pickerDate)
      displayFormatter.locale = Locale(identifier: "en_US")
      displayFormatter.setLocalizedDateFormatFromTemplate("MMMdd")
      self.displayDate = displayFormatter.string(from: pickerDate)

    }
    resutlsVC.selectedDate = self.selectedDate
    resutlsVC.displayedDate = self.displayDate
    navigationController?.pushViewController(resutlsVC, animated: true)
  }
}
