//
//  ConnectionManager.swift
//  DynamicCellHeight
//
//  Created by Carolina Barreiro Cancela on 30/04/15.
//  Copyright (c) 2015 CarolinaBarreiro. All rights reserved.
//

import UIKit

protocol ConnectionProtocol {
  func didRecieveError(error: NSError!)
  func didRecieveResults(data: JSON!)
}

class ConnectionManager {
  
  var delegate: ConnectionProtocol?
  
  init() {
    
  }
  
  func retrieveData(url: String){
    request(.GET, url)
      .responseJSON { (req, res, json, error) in
        if error != nil {
          if let delegate = self.delegate {
            delegate.didRecieveError(error)
          }
        } else {
          if let delegate = self.delegate {
            delegate.didRecieveResults(JSON(json!))
          }
        }
    }
    
  }
  
}