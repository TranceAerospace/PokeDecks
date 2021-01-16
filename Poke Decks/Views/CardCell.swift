//
//  CardCell.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/16/21.
//

import UIKit

class CardCell: UICollectionViewCell {
	static let reuseID = "CardCell"
	let padding: CGFloat = 8
	
	let pokemonImageVIew = CardImageView(frame: .zero)
	let pokemonNameLabel = PKTitleLabel(textAlign: .center, fontSize: 16)
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func set(card: Card) {
		pokemonNameLabel.text = card.name
	}
	
	
	private func configure() {
		addSubview(pokemonImageVIew)
		addSubview(pokemonNameLabel)
		
		NSLayoutConstraint.activate([
			pokemonImageVIew.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
			pokemonImageVIew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			pokemonImageVIew.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			pokemonImageVIew.heightAnchor.constraint(equalTo: pokemonImageVIew.widthAnchor),
			
			pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageVIew.bottomAnchor, constant: 12),
			pokemonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			pokemonNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			pokemonNameLabel.heightAnchor.constraint(equalToConstant: 20)
		])
	}
	
}
