//
//  PKTextField.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import UIKit

class PKTextField: UITextField {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		
		layer.cornerRadius = 10
		layer.borderWidth = 2
		layer.borderColor = UIColor.systemGray4.cgColor
		
		textColor = .label
		tintColor = .label
		textAlignment = .center
		font = UIFont.preferredFont(forTextStyle: .title2)
		adjustsFontSizeToFitWidth = true
		minimumFontSize = 12
		
		backgroundColor = .tertiarySystemBackground
		autocorrectionType = .no
		placeholder = "Search for a set"
		returnKeyType = .go
	}
	
}
