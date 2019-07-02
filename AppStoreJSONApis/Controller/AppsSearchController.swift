//
//  AppsSearchController.swift
//  AppStoreJSONApis
//
//  Created by Daniyar Erkinov on 6/25/19.
//  Copyright © 2019 Daniyar Erkinov. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchController: UICollectionViewController {
  
  fileprivate let cellId = "id1234"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
    
    fetchITunesApps()
  }
  
  fileprivate var appResults = [Result]()
  
  fileprivate func fetchITunesApps() {
    Service.shared.fetchApps { (results, err) in
      if let err = err {
        print("Failed to fetch apps:", err)
        return
      }
      self.appResults = results
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return appResults.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
    cell.appResult = appResults[indexPath.item]
    return cell
  }
  
}

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 325)
  }
}
