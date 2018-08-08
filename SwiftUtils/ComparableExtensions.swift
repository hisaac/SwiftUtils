// Created by Isaac Halvorson on 1/30/18

/// These are utility functions that allow for comparing multiple properties to one property at once,
/// rather than needing to do multiple comparative statements.
///
/// So instead of
///
/// ```
/// if 4 > 1 && 4 > 2 && 4 > 3 { ... }
/// ```
///
/// We can do
///
/// ```
/// if 4.isGreaterThan(1, 2, 3) { ... }
/// ```
///
/// There are methods for all of the basic comparative types.
///
extension Comparable {
	public func isEqualToAllOfThese(_ args: Self...) -> Bool {
		return args.contains(self)
	}

	public func isEqualToOneOfThese(_ args: Self...) -> Bool {
		for arg in args {
			if arg == self { return true }
		}
		return false
	}

	public func isNotEqualTo(_ args: Self...) -> Bool {
		return !args.contains(self)
	}

	public func isLessThan(_ args: Self...) -> Bool {
		return args.contains { self < $0 }
	}

	public func isLessThanOrEqualTo(_ args: Self...) -> Bool {
		return args.contains { self <= $0 }
	}

	public func isGreaterThan(_ args: Self...) -> Bool {
		return args.contains { self > $0 }
	}

	public func isGreaterThanOrEqualTo(_ args: Self...) -> Bool {
		return args.contains { self >= $0 }
	}
}

struct ComparableUtils {
	public static func theseAreNotNil(_ args: Any?...) -> Bool {
		return !args.contains { $0 == nil }
	}

	public static func theseAreNil(_ args: Any?...) -> Bool {
		return args.contains { $0 == nil }
	}
}
