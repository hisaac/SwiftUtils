// Created by Isaac Halvorson on 8/8/18

extension Collection {
	public var isNotEmpty: Bool { return !isEmpty }

	/// Returns nil if the collection is empty, otherwise returns self
	var nilIfEmpty: Self? {
		return self.isNotEmpty ? self : nil
	}
}
