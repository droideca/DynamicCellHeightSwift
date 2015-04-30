//
//  Constants.swift
//  DynamicCellHeight
//
//  Created by Carolina Barreiro Cancela on 30/04/15.
//  Copyright (c) 2015 CarolinaBarreiro. All rights reserved.
//
import Foundation
import UIKit

struct Constants {
  struct Url {
    static let AppReview = "http://beta.json-generator.com/api/json/get/AoVBEkV"
  }
	struct Devices {
		static let Device = UIDevice.currentDevice()
		static let iosVersion = NSString(string: Device.systemVersion).doubleValue
		static let iOS8 = iosVersion >= 8
		static let iOS7 = iosVersion >= 7 && iosVersion < 8
	}
	
}