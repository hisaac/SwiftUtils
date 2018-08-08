// Created by Isaac Halvorson on 7/25/18

import UIKit

class LocalizedIndexedCollationWithFavorites: UILocalizedIndexedCollation {

	let collation = UILocalizedIndexedCollation.current()

	override var sectionTitles: [String] {
		var sectionTitles = collation.sectionTitles

		let localizedRecentContactsSectionTitle = NSLocalizedString(
			"Recent Contacts",
			comment: "Title for the Recent Contacts section of the main contacts list"
		)

		sectionTitles.insert(localizedRecentContactsSectionTitle, at: 0)
		return sectionTitles
	}

	override var sectionIndexTitles: [String] {
		var sectionIndexTitles = collation.sectionIndexTitles
		sectionIndexTitles.insert("★", at: 0)
		return sectionIndexTitles
	}

	override func section(for object: Any, collationStringSelector selector: Selector) -> Int {
		return collation.section(for: object, collationStringSelector: selector) + 1
	}

}
