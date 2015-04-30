//
//  DynamicLabel.swift
//  DynamicCellHeight
//
//  Created by Carolina Barreiro Cancela on 30/04/15.
//  Copyright (c) 2015 CarolinaBarreiro. All rights reserved.
//

import UIKit

class DynamicLabel: UILabel {
	override var bounds: CGRect {
		didSet {
			if numberOfLines == 0 && self.bounds.size.width != preferredMaxLayoutWidth {
				self.preferredMaxLayoutWidth = self.bounds.size.width 
				self.setNeedsUpdateConstraints()
			}
			
		}
	}

		
}

