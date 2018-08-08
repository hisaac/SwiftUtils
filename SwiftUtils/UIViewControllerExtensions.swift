// Created by Isaac Halvorson on 8/8/18

import UIKit

extension UIViewController {
	func embedInNavigationController(prefersLargeTitles: Bool = true) -> UINavigationController {
		let navigationController = UINavigationController()

		if prefersLargeTitles, #available(iOS 11.0, *) {
			navigationController.navigationBar.prefersLargeTitles = true
		}

		navigationController.viewControllers = [self]
		return navigationController
	}
}
