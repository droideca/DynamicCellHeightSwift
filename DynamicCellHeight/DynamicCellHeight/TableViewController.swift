//
//  ViewController.swift
//  DynamicCellHeight
//
//  Created by Carolina Barreiro Cancela on 30/04/15.
//  Copyright (c) 2015 CarolinaBarreiro. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ConnectionProtocol {

	var appReview = AppReviews()
	var connectionManager = ConnectionManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		connectionManager.delegate = self
		connectionManager.retrieveData(Constants.Url.AppReview)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func didRecieveError(error: NSError!) {
		println(error)
	}
	
	func didRecieveResults(data: JSON!) {
		appReview = AppReviews(json: data)
	}
	
	

}

