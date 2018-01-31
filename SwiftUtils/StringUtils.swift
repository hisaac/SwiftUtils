//
// Created by Isaac Halvorson on 1/31/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

class StringUtils {
	static func stringIsEmptyOrNil(_ string: String?) -> Bool {
		return (string ?? "").isEmpty
	}
}
