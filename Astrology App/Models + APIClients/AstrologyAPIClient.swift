//
//  AstrologyAPIClient.swift
//  Astrology App
//
//  Created by Maitree Bain on 7/6/21.
//

import UIKit
import Foundation

struct AstrologyAPIClient {
    
    func getSign(sign: String, completion: @escaping (Result<AstrologyModel, Error>) -> ()) {
        
        let endpoint = "http://sandipbgt.com/theastrologer/api/horoscope/\(sign)/today"
        
        guard let url = URL(string: endpoint) else {
            print("no url found")
            return
        }
        
        let request = URLRequest(url: url)
        
        let datatask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    let zodiac = try JSONDecoder().decode(AstrologyModel.self, from: data)
                    completion(.success(zodiac))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        datatask.resume()
    }
}
