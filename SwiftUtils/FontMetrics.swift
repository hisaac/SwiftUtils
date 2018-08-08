// Created by Chris Sessions on 2017-10-14
//
// File from [this GitHub Gist](https://gist.github.com/samadhiBot/48a5b616c0447122050f754c3c2a6b80)
// Found via [this article](https://medium.com/livefront/practical-dynamic-type-d2b5774e8a8a)

import UIKit

/// A `UIFontMetrics` wrapper, allowing iOS 11 devices to take advantage of `UIFontMetrics` scaling,
/// while earlier iOS versions fall back on a scale calculation.
///
struct FontMetrics {

	/// A scale value based on the current device text size setting. With the device using the
	/// default Large setting, `scaler` will be `1.0`. Only used when `UIFontMetrics` is not
	/// available.
	///
	static var scaler: CGFloat {
		return UIFont.preferredFont(forTextStyle: .body).pointSize / 17.0
	}

	/// Returns a version of the specified font that adopts the current font metrics.
	///
	/// - Parameter font: A font at its default point size.
	/// - Returns: The font at its scaled point size.
	///
	static func scaledFont(for font: UIFont) -> UIFont {
		if #available(iOS 11.0, *) {
			return UIFontMetrics.default.scaledFont(for: font)
		} else {
			return font.withSize(scaler * font.pointSize)
		}
	}

	/// Returns a version of the specified font that adopts the current font metrics and is
	/// constrained to the specified maximum size.
	///
	/// - Parameters:
	///   - font: A font at its default point size.
	///   - maximumPointSize: The maximum point size to scale up to.
	/// - Returns: The font at its constrained scaled point size.
	///
	static func scaledFont(for font: UIFont, maximumPointSize: CGFloat) -> UIFont {
		if #available(iOS 11.0, *) {
			return UIFontMetrics.default.scaledFont(for: font,
													maximumPointSize: maximumPointSize,
													compatibleWith: nil)
		} else {
			return font.withSize(min(scaler * font.pointSize, maximumPointSize))
		}
	}

	/// Scales an arbitrary layout value based on the current Dynamic Type settings.
	///
	/// - Parameter value: A default size value.
	/// - Returns: The value scaled based on current Dynamic Type settings.
	///
	static func scaledValue(for value: CGFloat) -> CGFloat {
		if #available(iOS 11.0, *) {
			return UIFontMetrics.default.scaledValue(for: value)
		} else {
			return scaler * value
		}
	}
}
