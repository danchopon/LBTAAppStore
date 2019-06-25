//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Daniyar Erkinov on 6/25/19.
//  Copyright © 2019 Daniyar Erkinov. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewControllers = [
      createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
      createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
      createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps")
    ]
    
  }
  
  fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
    
    let navController = UINavigationController(rootViewController: viewController)
    navController.navigationBar.prefersLargeTitles = true
    viewController.navigationItem.title = title
    viewController.view.backgroundColor = .white
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(named: imageName)
    return navController
    
  }
  
}
