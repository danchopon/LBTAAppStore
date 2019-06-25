//
//  AppsSearchController.swift
//  AppStoreJSONApis
//
//  Created by Daniyar Erkinov on 6/25/19.
//  Copyright © 2019 Daniyar Erkinov. All rights reserved.
//

import UIKit

class AppsSearchController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
  }
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
