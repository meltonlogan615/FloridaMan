//
//  ArticleModel.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/20/22.
//

import Foundation

struct Article: Decodable, Identifiable, Hashable, Comparable {
  var url: String
  var title: String
  var time: String
  var score: Int
  var permalink: String
  var over_18: Bool
  var id: String
  var domain: String
  var selftext: String
  var verbs: [String]
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.time < rhs.time
  }
}


// image attribution: <a href="https://www.freepik.com/vectors/background">Background vector created by freepik - www.freepik.com</a>
// <a href="https://www.freepik.com/vectors/background">Background vector created by pikisuperstar - www.freepik.com</a>
