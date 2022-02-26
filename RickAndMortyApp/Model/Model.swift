//
//  Model.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 26/02/22.
//

import Foundation

struct Character: Decodable {
    var results: [Characters]
}

struct Characters: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var origin: origin
    var location: location
    var image: String
    var episode: [String]
    
}
struct origin: Decodable {
    var name: String
    var url: String
}
struct location: Decodable {
    var name: String
    var url: String
}
