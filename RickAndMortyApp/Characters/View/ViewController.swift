//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 25/02/22.
//

import UIKit
import SDWebImage
import Lottie
import Hero

class ViewController: UIViewController, UISearchBarDelegate {
    var fieldState: Bool = false
    var data: CharacterViewModel = RickAndMortyContainer.shared.resolve(CharacterViewModel.self)!
    var Characters: [Characters] = []
    var character: [Characters] = []
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var CharacterCollectionView: UICollectionView!
    @IBOutlet weak var searchIcon: UIBarButtonItem!
    let lottie = AnimationView(name: "loader")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        CharacterCollectionView.heroID = "bg"
        CharacterCollectionView.hero.modifiers = [.cascade]
        self.navigationItem.titleView = searchBar
        self.navigationItem.titleView?.isHidden = true
        searchBar.delegate = self
        
        setupLoader()
        
        data.fetchCharacter()
        data.onShowCharacters = {
            DispatchQueue.main.async {
                self.setAllCharacters()
            }
        }
        data.onFilterCharacters = {
            DispatchQueue.main.async {
                self.showFiltered()
            }
        }

    }
    func setupLoader() {
        view.addSubview(lottie)
        view.isUserInteractionEnabled = false
        lottie.loopMode = .repeat(.infinity)
        lottie.play()
        lottie.isHidden = false
        lottie.translatesAutoresizingMaskIntoConstraints = false
        lottie.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lottie.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lottie.widthAnchor.constraint(equalToConstant: 100).isActive = true
        lottie.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    func showFiltered() {
        self.Characters = data.Filteredcharacters
        self.CharacterCollectionView.reloadData()
        self.lottie.pause()
        self.lottie.isHidden = true
        self.view.isUserInteractionEnabled = true
    }
    func setAllCharacters() {
        self.Characters = data.Allcharacters
        self.CharacterCollectionView.reloadData()
        self.lottie.pause()
        self.lottie.isHidden = true
        self.view.isUserInteractionEnabled = true
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
                setAllCharacters()
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let field = searchBar.text else { return }
        print("field", field)
        data.filterCharacter(filterField: field)
    }
 
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.Characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CharacterCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharacterCell else {
            fatalError()
        }
        cell.configCell(with: Characters[indexPath.row])
        cell.hero.modifiers = [.fade, .scale(0.5)]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.character = []
        self.character = [Characters[indexPath.row]]
        performSegue(withIdentifier: "characterDetail", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! DetailsViewController
        vc.character = self.character
    }
    

}
