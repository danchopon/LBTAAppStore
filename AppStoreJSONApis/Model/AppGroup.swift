//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by Daniyar Erkinov on 7/2/19.
//  Copyright © 2019 Daniyar Erkinov. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
  let feed: Feed
}

struct Feed: Decodable {
  let title: String
  let results: [FeedResult]
}

struct FeedResult: Decodable {
  let name, artistName, artworkUrl100: String
}
