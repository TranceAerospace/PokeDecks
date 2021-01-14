//
//  PKButton.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import UIKit

class PKButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	//Required by Storyboard case
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(backgroundColor: UIColor, title: String) {
		super.init(frame: .zero)
		self.backgroundColor = backgroundColor
		self.setTitle(title, for: .normal)
		configure()
	}
	
	private func configure() {
		layer.cornerRadius = 10
		setTitleColor(.white, for: .normal)
		titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		translatesAutoresizingMaskIntoConstraints = false
	}
}
