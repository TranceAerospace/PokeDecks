//
//  NetworkManager.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import UIKit

class NetworkManager {

	static let shared = NetworkManager()
	let setURL = "https://api.pokemontcg.io/v1/sets/"
	let cardListURL = "https://api.pokemontcg.io/v1/cards?setCode=" //swsh2
	let cardURL = "https://api.pokemontcg.io/v1/cards?name="
	
	let cache = NSCache<NSString, UIImage>()

	private init() {}

	func getCards(for set: String, page: Int, completed: @escaping (Result<CardList, PKError>) -> Void) {
		let endpoint = cardListURL + set
		
		guard let url = URL(string: endpoint) else {
			completed(.failure(.invalidUserName))
			return
		}
	
		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
		
		if let _ = error {
			completed(.failure(.unableToComplete))
			return
		}
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			completed(.failure(.invalidResponse))
			return
		}
		
		guard let data = data else {
			print("failed to return data")
			completed(.failure(.invalidData))
			return
		}
			
		do {
			let decoder = JSONDecoder()
			//decoder.keyDecodingStrategy = .convertFromSnakeCase
			let setList = try decoder.decode(CardList.self, from: data)
			completed(.success(setList))
		} catch {
			print("failed to decode data")
			completed(.failure(.invalidData))
		}
		
	}
	
	task.resume()
	}
}
