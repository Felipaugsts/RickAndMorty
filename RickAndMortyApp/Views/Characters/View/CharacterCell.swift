//
//  CharacterCell.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 26/02/22.
//

import UIKit
import Hero

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    
    func configCell(with character: Characters) {
        title.text = character.name
        imageView.sd_setImage(with: URL(string: "\(character.image)"), placeholderImage: UIImage(named: "placeholder.png"))
        imageView.hero.id = character.name
        title.hero.id = character.name
        
        statusView.layer.masksToBounds = true
        statusView.layer.cornerRadius = statusView.frame.width / 2
        
        status.text = character.status
        if character.status == "Alive" {
            statusView.backgroundColor = .systemGreen }
       else if character.status == "Dead" {
           statusView.backgroundColor = .systemRed
       } else {
           statusView.backgroundColor = .systemBrown
       }

    }

}
