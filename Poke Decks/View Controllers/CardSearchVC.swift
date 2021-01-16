//
//  CardSearchVC.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/11/21.
//

import UIKit

class CardSearchVC: UIViewController {
		
		let logoImageView = UIImageView()
		let setNameTextField = PKTextField()
		let callToActionButton = PKButton(backgroundColor: UIColor(red: 31/255, green: 98/255, blue: 163/255, alpha: 1.0), title: "Find my Card!")
		
		var isUserNameEntered: Bool {
			return !setNameTextField.text!.isEmpty
		}
		

		override func viewDidLoad() {
			super.viewDidLoad()

			view.backgroundColor = .systemBackground
			configureLogoImageView()
			configureTextField()
			configureCallToActionButton()
			createDismissKeyboardTapGesture()
		}
		
		override func viewWillAppear(_ animated: Bool) {
			super.viewWillAppear(animated)
			navigationController?.setNavigationBarHidden(true, animated: true)
		}
		
		func createDismissKeyboardTapGesture() {
			let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
			view.addGestureRecognizer(tap)
			
		}
		
		@objc func pushFollowerListVC() {
			guard isUserNameEntered else {
				presentGFAlertOnMainThread(title: "No Card", message: "Please Enter a Pokemon. We need to know who to look for 😀.", buttonTitle: "OK")
				return
			}
			
			let cardListVC = CardListVC()
			cardListVC.cardName = setNameTextField.text
			cardListVC.title = setNameTextField.text
			navigationController?.pushViewController(cardListVC, animated: true)
		}
		
		
		
		
		func configureLogoImageView() {
			view.addSubview(logoImageView)
			logoImageView.translatesAutoresizingMaskIntoConstraints = false
			logoImageView.image = UIImage(named: "pokeball")!
			
			NSLayoutConstraint.activate([
				logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
				logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
				logoImageView.heightAnchor.constraint(equalToConstant: 200),
				logoImageView.widthAnchor.constraint(equalToConstant: 200)
			])
		}
		
		func configureTextField() {
			view.addSubview(setNameTextField)
			setNameTextField.delegate = self
			
			NSLayoutConstraint.activate([
				setNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
				setNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
				setNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
				setNameTextField.heightAnchor.constraint(equalToConstant: 50)
			])
		}
		
		func configureCallToActionButton() {
			view.addSubview(callToActionButton)
			callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
			
			NSLayoutConstraint.activate([
				callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
				callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
				callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
				callToActionButton.heightAnchor.constraint(equalToConstant: 50)
			])
		}
}

	extension CardSearchVC: UITextFieldDelegate {
		func textFieldShouldReturn(_ textField: UITextField) -> Bool {
			pushFollowerListVC()
			return true
		}
	}

