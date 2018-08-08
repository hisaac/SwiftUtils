// Created by Isaac Halvorson on 1/31/18

import Foundation

/// Date extensions for anything
extension Date {

	/// Returns the start of the day
	public var startOfDay: Date {
		return Calendar.current.startOfDay(for: self)
	}

	/**
	 Returns the last second of the day
	 */
	public var endOfDay: Date {
		/// There are 86400 seconds in a day, so if we add one less than that to `startOfDay`, we get the end of the day
		return startOfDay.addingTimeInterval(86_399)
	}

	public func secondsFrom(_ date: Date) -> Int {
		return interval(ofComponent: .second, fromDate: date)
	}

	public func minutesFrom(_ date: Date) -> Int {
		return interval(ofComponent: .minute, fromDate: date)
	}

	public func interval(ofComponent component: Calendar.Component, fromDate date: Date) -> Int {
		let currentCalendar = Calendar.current
		guard let start = currentCalendar.ordinality(of: component, in: .era, for: date) else { return 0 }
		guard let end = currentCalendar.ordinality(of: component, in: .era, for: self) else { return 0 }
		return end - start
	}

	public func add(_ amount: Int, ofComponent component: Calendar.Component) -> Date? {
		return Calendar.current.date(byAdding: component, value: amount, to: self)
	}

	public func isSameDay(as dateToCompare: Date) -> Bool {
		let currentCalendar = Calendar.current
		return currentCalendar.compare(self, to: dateToCompare, toGranularity: .day) == .orderedSame
	}
}

/// Date extensions for display use
extension Date {

	/// Returns the date as a string in the `.medium` format
	public var dateForDisplay: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.locale = Locale.current
		return dateFormatter.string(from: self)
	}

	public var timeForDisplay: String {
		let dateFormatter = DateFormatter()
		dateFormatter.timeStyle = .short
		dateFormatter.locale = Locale.current
		return dateFormatter.string(from: self)
	}

	public var dateTimeForDisplay: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .short
		dateFormatter.locale = Locale.current
		return dateFormatter.string(from: self)
	}
}

/// Date extensions for API calls
extension Date {
	public func formatDateForService() -> String {

		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
		dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
		dateFormatter.calendar = Calendar(identifier: .iso8601)
		let formattedDateString = "\(dateFormatter.string(from: Date()))Z"

		return formattedDateString
	}
}
