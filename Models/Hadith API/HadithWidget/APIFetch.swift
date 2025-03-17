//
//  APIFetch.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 3/17/25.
//

import Foundation


class APIFetch {
    
    func getHadith(completion: @escaping ([HadithDataModel]) -> Void) {
        guard let url = URL(string: "https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions.json") else {
            print("Cooked ggs")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let hadithData = try JSONDecoder().decode([HadithDataModel].self, from: data)
                DispatchQueue.main.async {
                    completion(hadithData)
                }
            } catch {
                print("cooked")
            }
        }
        task.resume()
    }
}
