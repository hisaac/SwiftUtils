// Created by Isaac Halvorson on 8/8/18

extension Collection {

	/// Returns true if the collection is not empty
	var isNotEmpty: Bool { return !isEmpty }

	/// Returns nil if the collection is empty, otherwise returns self
	var nilIfEmpty: Self? {
		return isNotEmpty ? self : nil
	}

}
