//
//  NetworkManager.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import Foundation

class NetworkManager {

	static let shared = NetworkManager()
	let setURL = "https://api.pokemontcg.io/v1/sets"
	let cardURL = "https://api.pokemontcg.io/v1/cards?name="

	private init() {}

	func getCards(for set: String, page: Int, completed: @escaping (Result<SetList, PKError>) -> Void) {
		let endpoint = setURL //+ "\(set)/followers?per_page=100&page=\(page)"
		
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
			let setList = try decoder.decode(SetList.self, from: data)
			completed(.success(setList))
		} catch {
			print("failed to decode data")
			completed(.failure(.invalidData))
		}
		
	}
	
	task.resume()
	}
}
