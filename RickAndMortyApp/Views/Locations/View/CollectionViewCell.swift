//
//  CollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 02/03/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundcell: UIView!
    @IBOutlet weak var residents: UILabel!
    @IBOutlet weak var dimension: UILabel!
    @IBOutlet weak var title: UILabel!
    func configuration(with planet: Planet) {
        title.text = planet.name
        dimension.text = planet.dimension ?? "Unknown"
        residents.text = "Number of residents: \(planet.residents.count)"
        backgroundcell.layer.cornerRadius = 10
        
    }
}
