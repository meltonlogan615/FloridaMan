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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Today"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    view.backgroundColor = .systemGray5

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
      cell.backgroundColor = UIColor(named: "FM-Red")
      cell.headlineLabel.textColor = .white
      cell.sourceLabel.textColor = .white
      cell.dateLabel.textColor = .white
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
      withDuration: 0.5,
      delay: 0.1 * Double(indexPath.row),
      animations: {
        cell.alpha = 1
      })
  }
}

extension ArticleTableViewController {
  // Getting articles from JSON
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
      self.tableView.reloadData()
    }
  }
  
  // Filetering Articles by Date
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


  
  
