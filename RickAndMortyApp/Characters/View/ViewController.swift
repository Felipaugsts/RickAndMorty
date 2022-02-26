//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 25/02/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UISearchBarDelegate {
    var fieldState: Bool = false
    var data: CharacterViewModel = RickAndMortyContainer.shared.resolve(CharacterViewModel.self)!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var CharacterCollectionView: UICollectionView!
    @IBOutlet weak var searchIcon: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = searchBar
        self.navigationItem.titleView?.isHidden = true
        searchBar.delegate = self
        // Do any additional setup after loading the view.
        
        data.fetchCharacter()
        data.onShowCharacters = {
            DispatchQueue.main.async {
                self.CharacterCollectionView.reloadData()
            }
        }

    }
    
    @IBAction func onIconTap(_ sender: UIBarButtonItem) {
        print("test")
    }
    @IBAction func onSearchTap(_ sender: UIBarButtonItem) {
            if fieldState == false {
                fieldState = true
                navigationItem.rightBarButtonItem?.image = UIImage(systemName: "xmark.circle")
                animateSearchBar()
                
                navigationItem.titleView
            searchBar.setShowsScope(true, animated: true)
            self.navigationItem.titleView?.isHidden = false
            } else {
                fieldState = false
                searchBar.setShowsScope(true, animated: true)
                self.navigationItem.titleView?.isHidden = true
                navigationItem.rightBarButtonItem?.image = UIImage(systemName: "magnifyingglass")
            }
        
    }
    func animateSearchBar() {
        let animationTransition = CATransition()
        animationTransition.duration = 0.1
        animationTransition.type = CATransitionType.push
        animationTransition.subtype = CATransitionSubtype.fromBottom
        searchBar.layer.add(animationTransition, forKey: "pushText")
    }
 
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.Allcharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CharacterCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharacterCell else {
            fatalError()
        }
        let character = data.Allcharacters[indexPath.row]
        cell.title.text = character.name
        cell.imageView.sd_setImage(with: URL(string: "\(character.image)"), placeholderImage: UIImage(named: "placeholder.png"))
    
        
        return cell
    }
    
    
}
