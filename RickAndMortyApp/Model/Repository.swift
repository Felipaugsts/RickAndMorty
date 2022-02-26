//
//  Repository.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 26/02/22.
//

import Foundation

protocol RickAndMortyRepositoryProtocol {
    func fetchCharacters(complition: @escaping (Character) -> ())
}

class RicknMortyRepository: RickAndMortyRepositoryProtocol {
    let api: RickandMortyProtocol
    
    init (api: RickandMortyProtocol) {
        self.api = api
    }
    
    func fetchCharacters(complition: @escaping (Character) -> ()) {
        api.getCharacters(complition: complition)
        print("repository", complition)
    }
    
    
}
