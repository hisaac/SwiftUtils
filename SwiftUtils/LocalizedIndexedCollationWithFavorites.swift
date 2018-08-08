// Created by Isaac Halvorson on 7/25/18

import UIKit

class LocalizedIndexedCollationWithFavorites: UILocalizedIndexedCollation {

	private let collation = UILocalizedIndexedCollation.current()

	public override var sectionTitles: [String] {
		var sectionTitles = collation.sectionTitles

		let localizedRecentContactsSectionTitle = NSLocalizedString(
			"Recent Contacts",
			comment: "Title for the Recent Contacts section of the main contacts list"
		)

		sectionTitles.insert(localizedRecentContactsSectionTitle, at: 0)
		return sectionTitles
	}

	public override var sectionIndexTitles: [String] {
		var sectionIndexTitles = collation.sectionIndexTitles
		sectionIndexTitles.insert("★", at: 0)
		return sectionIndexTitles
	}

	public override func section(for object: Any, collationStringSelector selector: Selector) -> Int {
		return collation.section(for: object, collationStringSelector: selector) + 1
	}

}
