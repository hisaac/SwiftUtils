// Created by Isaac Halvorson on 8/8/18

import UIKit

extension UITableViewCell {
	var hasDetailText: Bool {
		if let detailText = detailTextLabel?.text {
			return detailText.isEmpty.opposite
		} else {
			return false
		}
	}
}
