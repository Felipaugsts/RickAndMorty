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
    private(set) var Filteredcharacters: [Characters] = []
    
    var onShowCharacters: (() -> Void)?
    var onFilterCharacters: (() -> Void)?
    
    init(repository: RickAndMortyRepositoryProtocol) {
        self.repository = repository
    }


    func fetchCharacter() {
        repository.fetchCharacters { [weak self] characters in
            self?.Allcharacters.append(contentsOf: characters.results)
            self?.onShowCharacters?()
        }
    }
    func filterCharacter(filterField: String)  {
        print("nil field", filterField)
        if filterField != "" {
        self.Filteredcharacters = []
        Allcharacters.map { charact in
            if charact.name.contains(filterField) {
                self.Filteredcharacters.append(charact.self)
                self.onFilterCharacters?()
            }
            
        }
        } else {
            print("nil field", filterField)
        }
        
        print(Filteredcharacters.count)
    }
}
