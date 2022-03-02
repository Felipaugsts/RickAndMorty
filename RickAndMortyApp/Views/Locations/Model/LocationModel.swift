//
//  Model.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 02/03/22.
//

import Foundation

struct Planets: Decodable {
    var results: [Planet]
}
struct Planet: Decodable {
    var id: Int
    var name: String
    var type: String
    var dimension: String?
    var residents: [String]
}
