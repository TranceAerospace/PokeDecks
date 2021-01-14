//
//  NetworkManager.swift
//  Poke Decks
//
//  Created by Mark Trance on 1/13/21.
//

import Foundation

class NetworkManager {

	static let shared = NetworkManager()
	let baseURL = "https://api.github.com/users/"

	private init() {}

	func getCards(for set: String, page: Int, completed: @escaping (Result<[Card], GFError>) -> Void) {
		let endpoint = baseURL + "\(set)/followers?per_page=100&page=\(page)"
		
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
			completed(.failure(.invalidData))
			return
		}
		
		do {
			let decoder = JSONDecoder()
			decoder.keyDecodingStrategy = .convertFromSnakeCase
			let followers = try decoder.decode([Card].self, from: data)
			completed(.success(followers))
		} catch {
			completed(.failure(.invalidData))
		}
		
	}
	
	task.resume()
	}
}
