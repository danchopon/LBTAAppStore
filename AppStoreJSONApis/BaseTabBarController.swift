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
    
    let redViewController = UIViewController()
    redViewController.view.backgroundColor = .white
    redViewController.navigationItem.title = "Apps"
    
    let redNavController = UINavigationController(rootViewController: redViewController)
    redNavController.tabBarItem.title = "Apps"
    redNavController.tabBarItem.image = UIImage(named: "apps")
    redNavController.navigationBar.prefersLargeTitles = true
    
    let blueViewController = UIViewController()
    blueViewController.view.backgroundColor = .white
    blueViewController.navigationItem.title = "Search"
    
    let blueNavController = UINavigationController(rootViewController: blueViewController)
    blueNavController.tabBarItem.title = "Search"
    blueNavController.tabBarItem.image = UIImage(named: "search")
    blueNavController.navigationBar.prefersLargeTitles = true
    
    viewControllers = [
      redNavController,
      blueNavController
    ]
  }
}
