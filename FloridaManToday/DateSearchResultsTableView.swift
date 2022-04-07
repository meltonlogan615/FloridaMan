//
//  DateSearchResultsTableView.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/28/22.
//

import Foundation

import UIKit

protocol PassingDate {
  func getSelectedDateArticles(from articles: [Article])
}


class DateSearchResultsTableView: UITableViewController {
    
  var displayedDate = String()
  
  var articlesForDate = [Article]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Florida Man: \(displayedDate)"
    navigationController?.navigationBar.tintColor = .label
    navigationController?.navigationBar.prefersLargeTitles = true
    view.backgroundColor = UIColor(named: "FM-Blue")
    title = displayedDate
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(ArticleCell.self, forCellReuseIdentifier: "cell")
    tableView.reloadData()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    articlesForDate.removeAll()
  }
}

extension DateSearchResultsTableView {
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
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.alpha = 0
    print("I dooz it")
    UIView.animate(
      withDuration: 0.75,
      delay: 0.1 * Double(indexPath.row),
      animations: {
        cell.alpha = 1
      })
  }
}





