// Created by Isaac Halvorson on 8/8/18

extension String {

	/// Shortcut to convert first character in a string to a string
	var firstLetter: String {
		return String(self[startIndex])
	}

	/// Shortcut to convert string to a base 64 encoded string
	var base64String: String? {
		return self.data(using: .utf8)?.base64EncodedString()
	}

	var isValidEmail: Bool {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
		let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: self)
	}

	var isValidPhoneNumber: Bool {
		let phoneRegex = "^[0-9()-]+$"
		let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
		return phoneTest.evaluate(with: self)
	}

	var isValidEmailOrPhoneNumber: Bool {
		return
			isValidEmail ||
			isValidPhoneNumber
	}

}
