//
//  DataProvider.swift
//  FloridaManToday
//
//  Created by Logan Melton on 2/20/22.
//

import Foundation

class DataProvider  {
  
  private let networkDataFlow = NetworkDataFlow()
  
  func getArticle<T: Decodable>(for: String, completion: @escaping (Result<T, Error>) -> Void) {
    let recipeEndpoint = EndPoints.getFloridaMan(for: "")
    networkDataFlow.getData(for: recipeEndpoint.endpointURL) { (result: Result<T, Error>) in
      completion(result)
    }
  }
}
