//
//  PKTitleLabel.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/11/21.
//

import UIKit

class PKTitleLabel: UILabel {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	//Required for storyboard
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(textAlign: NSTextAlignment, fontSize: CGFloat) {
		super.init(frame: .zero)
		self.textAlignment = textAlign
		self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
		configure()
	}
	
	private func configure() {
		textColor = .label
		adjustsFontSizeToFitWidth = true
		minimumScaleFactor = 0.90
		lineBreakMode = .byTruncatingTail
		translatesAutoresizingMaskIntoConstraints = false
	}
	
}
