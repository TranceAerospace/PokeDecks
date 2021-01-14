//
//  PKBodyLabel.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import UIKit

class PKBodyLabel: UILabel {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(textAlign: NSTextAlignment) {
		super.init(frame: .zero)
		self.textAlignment = textAlign
		configure()
		
	}

	private func configure() {
		textColor = .secondaryLabel
		font = UIFont.preferredFont(forTextStyle: .body)
		adjustsFontSizeToFitWidth = true
		minimumScaleFactor = 0.75
		lineBreakMode = .byWordWrapping
		translatesAutoresizingMaskIntoConstraints = false
	}

}
