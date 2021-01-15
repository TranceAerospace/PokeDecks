//
//  CardListVC.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import UIKit

class CardListVC: UIViewController {
	
	var setList: String!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		navigationController?.navigationBar.prefersLargeTitles = true
		
		NetworkManager.shared.getCards(for: setList, page: 1) { (result) in
			
			switch result {
			case .success(let setList):
				print(setList)
			case .failure(let error):
				self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}

}
