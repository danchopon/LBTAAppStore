//
//  AppsController.swift
//  AppStoreJSONApis
//
//  Created by Daniyar Erkinov on 7/2/19.
//  Copyright © 2019 Daniyar Erkinov. All rights reserved.
//

import UIKit

class AppsController: BaseListController {
  
  let cellId = "cellId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .yellow
    
    collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    return cell
  }
  
}

extension AppsController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 250)
  }
}
