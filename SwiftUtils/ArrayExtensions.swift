// Created by Isaac Halvorson on 8/8/18

extension Array {
	func arrayByAppending(_ element: Element) -> Array {
		var array = self
		array.append(element)
		return array
	}

	mutating func appendAndReturn(_ element: Element) -> Array {
		append(element)
		return self
	}

	mutating func prepend(_ element: Element) {
		insert(element, at: 0)
	}

	mutating func prependAndReturn(_ element: Element) -> Array {
		prepend(element)
		return self
	}

	func arrayByPrepending(_ element: Element) -> Array {
		var array = self
		array.prepend(element)
		return array
	}
}
