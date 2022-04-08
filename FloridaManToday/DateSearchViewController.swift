//
//  DateSearchViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/28/22.
//

import UIKit

class DateSearchViewController: UIViewController {
  
  let searchView = DateSearchView()
  let dataprovider = DataProvider()
  
  var model = [Article]()
  var articlesForDate = [Article]()
  
  let formatter = DateFormatter()
  let displayFormatter = DateFormatter()
  var selectedDate = String()
  var displayDate = String()
  var pickerDate = Date()
  
  override func viewWillAppear(_ animated: Bool) {
    articlesForDate.removeAll()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.blue
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
//    let resutlsVC = DateSearchResultsTableView()
    if self.selectedDate == "" {
      formatter.locale = Locale(identifier: "en_US")
      formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
      self.selectedDate = formatter.string(from: pickerDate)
      displayFormatter.locale = Locale(identifier: "en_US")
      displayFormatter.setLocalizedDateFormatFromTemplate("MMMdd")
      self.displayDate = displayFormatter.string(from: pickerDate)
    }
    getFMArticles()
  }
}

/// Perform Call before loading either DateSearchResultsTableView or NoFloridaManViewController depending on if there is anything to show
extension DateSearchViewController {
  func getFMArticles() {
    dataprovider.getArticle(for: "") { [weak self] (floridaMan: Result<[Article], Error>) in
      guard let self = self else { return }
      switch floridaMan {
        case .success(let model):
          let unsorted = model as [Article]
          self.model = unsorted.sorted().reversed()
          self.getSelectedDateArticles(from: self.model)
        case .failure(let error):
          print(error)
      }
      if self.articlesForDate.isEmpty {
        self.showNope()
      } else {
        let resutlsVC = DateSearchResultsTableView()
        resutlsVC.articlesForDate = self.articlesForDate
        resutlsVC.displayedDate = self.displayDate
        self.show(resutlsVC, sender: self)
      }
    }
  }
}

extension DateSearchViewController: PassingDate {
  func getSelectedDateArticles(from articles: [Article]) {
    formatter.locale = Locale(identifier: "en_US")
    formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
    for article in articles {
      let articleTime = article.time.dropLast(6)
      if self.selectedDate == articleTime {
        if articlesForDate.contains(article) {
          continue
        } else {
          self.articlesForDate.append(article)
        }
      }
    }
  }
}

extension DateSearchViewController {
  /// Checks to see if the todaysArticles array is empty. If it is, shows NoFloridaManViewController, else shows the ArticleTableViewController as per its default
  func showNope() {
    let nopeVC = NoFloridaManViewController()
    nopeVC.showNav = false
    show(nopeVC, sender: self)
  }
}
