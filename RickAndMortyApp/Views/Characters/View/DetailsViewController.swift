//
//  DetailsViewController.swift
//  RickAndMortyApp
//
//  Created by "FELIPE" AUGUSTO SILVA on 01/03/22.
//

import UIKit
import SDWebImage
import Hero

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var CharacterTitle: UILabel!
    @IBOutlet weak var CharacterImage: UIImageView!
    
    var character: [Characters] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        backView.heroID = "bg"
        
        CharacterTitle.hero.id = character[0].name
        CharacterTitle.text = character[0].name
        imageConfig()
        infoConfig()
        
    }

    func imageConfig() {
        CharacterImage.layer.masksToBounds = true
        CharacterImage.layer.cornerRadius = 15
        CharacterImage.hero.id = character[0].name
        CharacterImage.sd_setImage(with: URL(string: "\(character[0].image)"), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    func infoConfig() {
        status.text = character[0].status
        gender.text = character[0].gender
        specie.text = character[0].species
        origin.text = character[0].origin.name
    }
    
    @IBAction func onTapClose(_ sender: Any) {
//        self.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        dismiss(animated: true, completion: nil)
    }
    
}
