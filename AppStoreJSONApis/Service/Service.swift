//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by Daniyar Erkinov on 7/2/19.
//  Copyright © 2019 Daniyar Erkinov. All rights reserved.
//

import Foundation

class Service {
  static let shared = Service()
  
  func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
    let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
      
      if let err = err {
        print("failed to fetcch apps:", err)
        completion([], nil)
        return
      }
      
      guard let data = data else { return }
      
      do {
        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        completion(searchResult.results, nil)
        
      } catch let jsonErr {
        print("Failed to decode json: ", jsonErr)
        completion([], jsonErr)
      }
      
      
      }.resume()

  }
}
