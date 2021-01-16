//
//  CardListVC.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import UIKit

class CardListVC: UIViewController {
	
	enum Section {
		case main
	}
	
	var cardName: String!
	var cards: [Card] = []
	
	var collectionView: UICollectionView!
	var dataSource: UICollectionViewDiffableDataSource<Section, Card>!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViewController()
		configureCollectionView()
		getFollowers()
		configureDataSource()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}

	func configureViewController() {
		view.backgroundColor = .systemBackground
		navigationController?.navigationBar.prefersLargeTitles = true
		
		
	}

	func configureCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
		view.addSubview(collectionView)
		
		collectionView.backgroundColor = .systemBackground
		collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseID)
	}
	
	func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
		let width = view.bounds.width
		let padding: CGFloat = 12
		let minimumItemSpacing: CGFloat = 10
		
		let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
		let itemWidth = availableWidth / 3
		
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
		flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
		
		return flowLayout
	}
	
	func getFollowers() {
		NetworkManager.shared.getCards(for: cardName, page: 1) { (result) in
			
			switch result {
			case .success(let cards):
				self.cards = cards.cards
				self.updateData()
			case .failure(let error):
				self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
			}
		}
	}
	
	func configureDataSource() {
		dataSource = UICollectionViewDiffableDataSource<Section, Card>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, card) -> UICollectionViewCell? in
			
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseID, for: indexPath) as! CardCell
			cell.set(card: card)
			return cell
		})
	}
	
	func updateData() {
		var snapshot = NSDiffableDataSourceSnapshot<Section, Card>()
		snapshot.appendSections([.main])
		snapshot.appendItems(cards)
		
		DispatchQueue.main.async {
			self.dataSource.apply(snapshot, animatingDifferences: true)
		}
		
	}

}
