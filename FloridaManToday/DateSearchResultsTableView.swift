//
//  DateSearchResultsTableView.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/28/22.
//

import Foundation

import UIKit

class DateSearchResultsTableView: UITableViewController {
  
  let dataprovider = DataProvider()
  
  var selectedDate = String()
  var displayedDate = String()
  let formatter = DateFormatter()
  
  var model = [Article]()
  var articlesForDate = [Article]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Florida Man: \(displayedDate)"
    navigationController?.navigationBar.tintColor = .label
    view.backgroundColor = UIColor(named: "FM-Blue")
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(ArticleCell.self, forCellReuseIdentifier: "cell")
    getFMArticles()
  }
}

extension DateSearchResultsTableView {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articlesForDate.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleCell
    let article = articlesForDate[indexPath.row]
    if indexPath.row % 2 == 0 {
      cell.backgroundColor = UIColor(named: "FM-Red")
      cell.headlineLabel.textColor = .white
      cell.sourceLabel.textColor = .white
      cell.dateLabel.textColor = .white
    }
    cell.headlineLabel.text = article.title.capitalized
    cell.dateLabel.text = article.time
    cell.sourceLabel.text = article.domain
    return cell
  }
}

extension DateSearchResultsTableView {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let article = articlesForDate[indexPath.row]
    let articleVC = ArticleViewController()
    articleVC.articleURL = article.url
    navigationController?.pushViewController(articleVC, animated: true)
  }
}

extension DateSearchResultsTableView {
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
        self.tableView.reloadData()
      }
    }
  }
}

extension DateSearchResultsTableView: PassingDate {
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

extension DateSearchResultsTableView {
  /// Checks to see if the todaysArticles array is empty. If it is, shows NoFloridaManViewController, else shows the ArticleTableViewController as per its default
  func showNope() {
      let nopeVC = NoFloridaManViewController()
      show(nopeVC, sender: self)
  }
}
