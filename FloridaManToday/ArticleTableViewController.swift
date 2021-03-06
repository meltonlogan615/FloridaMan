//
//  ViewController.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/17/22.
//

import UIKit

class ArticleTableViewController: UITableViewController {
  
  let dataprovider = DataProvider()
  
  var model = [Article]()
  var todaysArticles = [Article]()
  
  let today = Date()
  let formatter = DateFormatter()
  
  override func viewWillAppear(_ animated: Bool) {
    getFMArticles()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Today"
    navigationController?.navigationBar.prefersLargeTitles = true
    view.backgroundColor = K.blue
    
    tableView.register(ArticleCell.self, forCellReuseIdentifier: "cell")
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 600.0
    
    getFMArticles()
  }
}

// DATASOURCE
extension ArticleTableViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let rowCount = todaysArticles.count
    return rowCount
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleCell
    let article = todaysArticles[indexPath.row]
    if indexPath.row % 2 == 0 {
      cell.backgroundColor = K.red
      cell.headlineLabel.textColor = .white
      cell.sourceLabel.textColor = .white
      cell.dateLabel.textColor = .white
    } else {
      cell.backgroundColor = K.yellow
      cell.headlineLabel.textColor = K.purple
      cell.sourceLabel.textColor = K.purple
      cell.dateLabel.textColor = K.purple
    }
    cell.headlineLabel.text = article.title.capitalized
    cell.sourceLabel.text = article.domain
    cell.dateLabel.text = article.time
    return cell
  }
}

// DELEGATE
extension ArticleTableViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let article = todaysArticles[indexPath.row]
    let articleVC = ArticleViewController()
    articleVC.articleURL = article.url
    navigationController?.pushViewController(articleVC, animated: true)
  }
}

// ANIMATIONS
extension ArticleTableViewController {
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.alpha = 0
    
    UIView.animate(
      withDuration: 0.75,
      delay: 0.1 * Double(indexPath.row),
      animations: {
        cell.alpha = 1
      })
  }
}

// Getting articles from JSON
extension ArticleTableViewController {
  func getFMArticles() {
    dataprovider.getArticle(for: "") { [weak self] (floridaMan: Result<[Article], Error>) in
      guard let self = self else { return }
      switch floridaMan {
        case .success(let model):
          let unsorted = model as [Article]
          self.model = unsorted.sorted().reversed()
          self.getTodaysArticles(from: self.model)
        case .failure(let error):
          print(error)
      }
      if self.todaysArticles.isEmpty {
        self.showNopeView()
      } else {
        self.tableView.reloadData()
      }
    }
  }
}

// Filetering Articles by Date
extension ArticleTableViewController {
  /// Takes the returned data, compares a formated date against the model's time property and adds those that match to the todaysArticles array while filtering duplicates
  func getTodaysArticles(from articles: [Article]) {
    formatter.locale = Locale(identifier: "en_US")
    formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
    let todays = formatter.string(from: self.today)
    for article in articles {
      let articleTime = article.time.dropLast(6)
      if todays == articleTime {
        if !todaysArticles.contains(article) {
          todaysArticles.append(article)
        }
      }
    }
  }
}

extension ArticleTableViewController {
  /// Checks to see if the todaysArticles array is empty. If it is, shows NoFloridaManViewController, else shows the ArticleTableViewController as per its default
  func showNopeView() {
    let nopeVC = NoFloridaManViewController()
    show(nopeVC, sender: self)
  }
}




