//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 26/02/22.
//

import Foundation
import UIKit

class CharacterViewModel {
    let repository: RickAndMortyRepositoryProtocol
    private(set) var Allcharacters: [Characters] = []
    
    var onShowCharacters: (() -> Void)?
    
    init(repository: RickAndMortyRepositoryProtocol) {
        self.repository = repository
    }


    func fetchCharacter() {
        repository.fetchCharacters { [weak self] characters in
            self?.Allcharacters.append(contentsOf: characters.results)
            self?.onShowCharacters?()
        }
    }
}
