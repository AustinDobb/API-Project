//
//  Dogs.swift
//  API Project
//
//  Created by Austin Dobberfuhl on 12/1/23.
//

import Foundation

struct Dog: Decodable {
    var message: String
    
    var imageURL: URL {
        URL(string: message)!
    }
}
