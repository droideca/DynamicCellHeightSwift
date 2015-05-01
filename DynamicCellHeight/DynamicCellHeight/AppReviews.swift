//
//  AppReviews.swift
//  DynamicCellHeight
//
//  Created by Carolina Barreiro Cancela on 30/04/15.
//  Copyright (c) 2015 CarolinaBarreiro. All rights reserved.
//

import Foundation

class AppReviews: NSObject {
  
  var reviews: [UserReviews] = []
  
  init(json: JSON!) {
    if json["feed"]["entry"] != nil {
      for (key: String, subJson: JSON) in json["feed"]["entry"] {
        if subJson["author"] != nil {
          reviews.append(UserReviews(json: subJson))
        }
      }
    }
  }
  override init() {
    super.init()
  }
}
