//
//  UserReviews.swift
//  DynamicCellHeight
//
//  Created by Carolina Barreiro Cancela on 30/04/15.
//  Copyright (c) 2015 CarolinaBarreiro. All rights reserved.
//

import UIKit

class UserReviews: NSObject {
  
  var authorName: String!
  var rating: Double!
  var title: String!
  var content: String!
  
  init(json : JSON!){
    authorName = json["author"]["name"]["label"].stringValue
    rating     = json["im:rating"]["label"].doubleValue
    title      = json["title"]["label"].stringValue
    content    = json["content"]["label"].stringValue
  }
}

