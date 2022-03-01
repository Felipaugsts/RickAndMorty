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
    }

    func imageConfig() {
        CharacterImage.layer.masksToBounds = true
        CharacterImage.layer.cornerRadius = 15
        CharacterImage.hero.id = character[0].name
        CharacterImage.sd_setImage(with: URL(string: "\(character[0].image)"), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    @IBAction func onTapClose(_ sender: Any) {
//        self.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        dismiss(animated: true, completion: nil)
    }
    
}
