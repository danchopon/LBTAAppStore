//
//  AppsSearchController.swift
//  AppStoreJSONApis
//
//  Created by Daniyar Erkinov on 6/25/19.
//  Copyright © 2019 Daniyar Erkinov. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchController: BaseListController {
  
  fileprivate let cellId = "id1234"
  
  var timer: Timer?
  
  fileprivate let searchController = UISearchController(searchResultsController: nil)
  
  fileprivate let enterSearchTermLabel: UILabel = {
    let label = UILabel()
    label.text = "Please enter search term above..."
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
    
    collectionView.addSubview(enterSearchTermLabel)
    enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
    
    setupSearchBar()
  }
  
  fileprivate func setupSearchBar() {
    definesPresentationContext = true
    navigationItem.searchController = self.searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.dimsBackgroundDuringPresentation = false
    searchController.searchBar.delegate = self
  }
  
  fileprivate var appResults = [Result]()
  
  fileprivate func fetchITunesApps() {
    Service.shared.fetchApps(searchTerm: "twitter") { (results, err) in
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
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    enterSearchTermLabel.isHidden = appResults.count != 0
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

extension AppsSearchController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print(searchText)
    
    timer?.invalidate()
    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
      Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
        self.appResults = res
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    })
  }
}
