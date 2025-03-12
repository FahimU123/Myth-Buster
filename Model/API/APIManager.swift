//
//  APIManager.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 3/18/25.
//

import Foundation


class APIManager {
    
    static let shared = APIManager()
    
    let apiKey = "$2y$10$gHmARct336dcTvNtqLkrUuQbSaiDouU9sDKBiJOlvJ1CXsfOA7z4G"
    
    static func fetchRandomHadith() async throws -> HadithData {
        let urlString = "https://hadithapi.com/api/hadiths?apiKey=\(shared.apiKey)&paginate=1"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
     
        let result = try JSONDecoder().decode(HadithResponse.self, from: data)
        
        guard let randomHadith = result.hadiths.data.randomElement() else {
            throw URLError(.cannotDecodeContentData)
        }
        
        return randomHadith
    }
}


