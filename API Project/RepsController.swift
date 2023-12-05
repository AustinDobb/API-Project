//
//  RepsController.swift
//  API Project
//
//  Created by Austin Dobberfuhl on 12/4/23.
//

import Foundation

//querys
//zip
//key:output Value: json"



class RepsController {
    
    enum RepresentativeError: Error, LocalizedError {
        case didntWork
    }
    
    struct SearchResponse: Codable {
        let results: [Representatives]
    }
    
    func fetchRepData(matching queryItems: [URLQueryItem]) async throws -> [Representatives] {
        var urlComponents = URLComponents(string: "https://whoismyrepresentative.com/getall_mems.php")!
        urlComponents.queryItems = queryItems
        print(urlComponents)
        let (data, _) = try await URLSession.shared.data(from: urlComponents.url!)
        
//        guard let httpResponse = response as? HTTPURLResponse,
//                      httpResponse.statusCode == 200 else {
//            throw RepresentativeError.didntWork
//                }
        
        let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
        return searchResponse.results
    }
}

