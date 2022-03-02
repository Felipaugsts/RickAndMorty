//
//  Location View Model.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 02/03/22.
//

import Foundation

class locationViewModel {
    let repository: RickAndMortyRepositoryProtocol
    var locations: [Planet] = []
    
    init(repository: RickAndMortyRepositoryProtocol) {
        self.repository = repository
    }
    var onFetchLocation: (() -> Void)?
    
    func fetchLocations() {
        repository.fetchLocation { Planets in
            self.locations.append(contentsOf: Planets.results)
            print("locat", self.locations)
            self.onFetchLocation?()
        }
    }
    
}
