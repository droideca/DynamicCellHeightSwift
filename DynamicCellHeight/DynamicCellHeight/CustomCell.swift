//
//  CustomCell.swift
//  DynamicCellHeight
//
//  Created by Carolina Barreiro Cancela on 30/04/15.
//  Copyright (c) 2015 CarolinaBarreiro. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!

	override func awakeFromNib() {
		if Constants.Devices.iOS7 {
			// http://www.raywenderlich.com/73602/dynamic-table-view-cell-height-auto-layout#comments
			// You can´t use a explicit preferred width in the inspector if you want to support iOS8, therefore we need to do it programmatically for iOS7 devices so it works as expected. You can use the width of the screen, more or less.
			titleLabel.preferredMaxLayoutWidth = 510
			contentLabel.preferredMaxLayoutWidth = 510
		}
	}
}
