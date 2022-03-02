//
//  LocationViewController.swift
//  RickAndMortyApp
//
//  Created by FELIPE AUGUSTO SILVA on 02/03/22.
//

import UIKit

class LocationViewController: UIViewController {

    var data: locationViewModel = RickAndMortyContainer.shared.resolve(locationViewModel.self)!
    @IBOutlet weak var LocationCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        data.fetchLocations()
        data.onFetchLocation = {
            DispatchQueue.main.async {
                self.LocationCV.reloadData()
            }
        }
    }
}

extension LocationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LocationCV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.configuration(with: data.locations[indexPath.row])
    
        return cell
    }
    
    
}
