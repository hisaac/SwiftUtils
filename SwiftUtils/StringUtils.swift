// Created by Isaac Halvorson on 1/31/18

struct StringUtils {
	public static func stringIsEmptyOrNil(_ string: String?) -> Bool {
		return (string ?? "").isEmpty
	}
}
