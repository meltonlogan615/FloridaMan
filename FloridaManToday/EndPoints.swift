//
//  EndPoints.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/20/22.
//

import Foundation

struct EndPoints {
  private let baseURL = "https://raw.githubusercontent.com/kmcelwee/florida/main/clean.json"
}

// Extension to build URL for Recipe Search
extension EndPoints {
  var endpointURL: URL {
    let completedURL = URL(string: baseURL)
    guard let url = completedURL else {
      preconditionFailure("Invalid URL: \(String(describing: completedURL))")
    }
    return url
  }
}



extension EndPoints {
  
  // Method to build URL for Recipe Search, passing in entered text
  static func getFloridaMan(for searched: String) -> EndPoints {
    return EndPoints()
  }
}

// Later, if additional endpoints or API provided functionality added, w will ned to futher extend EndPoints to generate the url & create the static func to recive the data that will be passed back in.
