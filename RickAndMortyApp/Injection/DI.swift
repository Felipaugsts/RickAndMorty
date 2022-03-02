//
//  DI.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 26/02/22.
//

import Foundation
import Swinject

class RickAndMortyContainer {
    public static var shared: Container {
       let container = Container()
        
        container.register(RickandMortyProtocol.self) { _ in RicknMortyApi() }
        
        container.register(RicknMortyRepository.self) { r in RicknMortyRepository(api: r.resolve(RickandMortyProtocol.self)!)
        }
        
        
//        MARK: VIEW MODELS
        
        container.register(CharacterViewModel.self) { r in CharacterViewModel(repository:  r.resolve(RicknMortyRepository.self)!)
        }
        container.register(locationViewModel.self) { r in locationViewModel(repository: r.resolve(RicknMortyRepository.self)!)}
    
        return container
    }
}
