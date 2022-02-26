//
//  Api.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 26/02/22.
//

import Foundation

protocol RickandMortyProtocol {
    
    func getCharacters(complition: @escaping (Character) -> ())
}

class RicknMortyApi: RickandMortyProtocol {
    
    let baseURL = "https://rickandmortyapi.com/api/"
    
    func getCharacters(complition: @escaping (Character) -> ()) {
        
        guard let sourceURL = URL(string: "\(baseURL)character") else {
            return
        }
        
        URLSession.shared.dataTask(with: sourceURL) { (Data, Response, Error) in
            if let data = Data {
                do {
                    let results = try! JSONDecoder().decode(Character.self, from: data)
                    complition(results)
                }
                catch {
                    print("error", Error)
                }
            }
        }.resume()
    }
    
    
}
