//
//  Api.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 26/02/22.
//

import Foundation
import CoreMedia

protocol RickandMortyProtocol {
    
    func getCharacters(complition: @escaping (Character) -> ())
    func fetchLocation(complition: @escaping (Planets) -> ())
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
    
    func fetchLocation(complition: @escaping (Planets) -> ()) {
        
        guard let sourceURL = URL(string: "\(baseURL)location") else {
            return
        }
        
        URLSession.shared.dataTask(with: sourceURL) { (Data, Response, Error) in
            if let data = Data {
                do {
                    let results = try! JSONDecoder().decode(Planets.self, from: data)
                    complition(results)
                }
                catch {
                    print("error", Error)
                }
            }
        }.resume()
    }
}
