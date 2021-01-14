//
//  UIVewController+Ext.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import UIKit

extension UIViewController {
	
	func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
		DispatchQueue.main.async {
			let alertVC = PKAlertVC(title: title, message: message, buttonTitle: buttonTitle)
			alertVC.modalPresentationStyle = .overFullScreen
			alertVC.modalTransitionStyle = .crossDissolve
			self.present(alertVC, animated: true)
		}
	}
}
