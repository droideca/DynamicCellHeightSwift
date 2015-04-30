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
	var customCell: CustomCell!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		connectionManager.delegate = self
		connectionManager.retrieveData(Constants.Url.AppReview)
		tableView.estimatedRowHeight=300
	
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
		configureCell(cell, indexPath: indexPath)
		println("\(indexPath.row). " + appReviews.reviews[indexPath.row].title + " \t " + appReviews.reviews[indexPath.row].content )
		return cell
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		if Constants.Devices.iOS8 {
			return UITableViewAutomaticDimension
		} else {
			if customCell == nil {
				customCell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
			}
			configureCell(customCell, indexPath: indexPath)
			return calculateHeightForConfiguredSizingCell(customCell)
		}

	}
	
	// MARK: - Tableview configuration cell
	
	private func configureCell(cell: CustomCell, indexPath: NSIndexPath){
		let review = appReviews.reviews[indexPath.row]
		cell.titleLabel.text = "\(indexPath.row). " + review.title
		cell.contentLabel.text = review.content
	}
	
	private func calculateHeightForConfiguredSizingCell(sizingCell: CustomCell) -> CGFloat {
		sizingCell.bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(tableView.frame), CGRectGetHeight(sizingCell.bounds));
		sizingCell.setNeedsLayout()
		sizingCell.layoutIfNeeded()
		println(sizingCell.titleLabel!.bounds.height)
		println(sizingCell.contentLabel!.bounds.height)
		let size = sizingCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize)
		return size.height + 1.0;
	}


	


	

}

