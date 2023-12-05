//
//  DoggoController.swift
//  API Project
//
//  Created by Austin Dobberfuhl on 12/1/23.
//

import Foundation

enum DoggoError: Error, LocalizedError {
    case noDoggoHafBeenFound
}

class DoggoController {
    
    let baseURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
      
        func fetchRandomDoggo() async throws -> Dog {
            let (data, response) = try await URLSession.shared.data(from: baseURL)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw DoggoError.noDoggoHafBeenFound
            }
            
            let jsonDecoder = JSONDecoder()
            let doggo = try jsonDecoder.decode(Dog.self, from: data)
            
            return doggo
        }
        
        
        func fetchImageData(for url: URL) async throws -> Data {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw DoggoError.noDoggoHafBeenFound
            }
            
            return data
        }
    }
    
