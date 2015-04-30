//
//  ViewController.swift
//  DynamicCellHeight
//
//  Created by Carolina Barreiro Cancela on 30/04/15.
//  Copyright (c) 2015 CarolinaBarreiro. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ConnectionProtocol {

	var appReviews = AppReviews()
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
	
	// MARK: - ConnectionProtocol

	func didRecieveError(error: NSError!) {
		println(error)
	}
	
	func didRecieveResults(data: JSON!) {
		appReviews = AppReviews(json: data)
		tableView.reloadData()
	}
	
	// MARK: - TableView DataSource
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return appReviews.reviews.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath:indexPath) as! CustomCell
		let review = appReviews.reviews[indexPath.row]
		cell.titleLabel.text = "\(indexPath.row). " + review.title
		cell.contentLabel.text = review.content
		return cell
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 70
	}

	


	

}

