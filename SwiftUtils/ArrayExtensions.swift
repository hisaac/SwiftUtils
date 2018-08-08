// Created by Isaac Halvorson on 8/8/18

extension Array {
	public func arrayByAppending(_ element: Element) -> Array {
		var array = self
		array.append(element)
		return array
	}

	public mutating func appendAndReturn(_ element: Element) -> Array {
		append(element)
		return self
	}

	public mutating func prepend(_ element: Element) {
		insert(element, at: 0)
	}

	public mutating func prependAndReturn(_ element: Element) -> Array {
		prepend(element)
		return self
	}

	public func arrayByPrepending(_ element: Element) -> Array {
		var array = self
		array.prepend(element)
		return array
	}
}
