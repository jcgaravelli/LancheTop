//
//  SandwicheViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 26/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Moya

class SandwicheViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var sandwichesCollectionView: UICollectionView!    
    
    fileprivate var lanches: [Sandwiche] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sandwichesCollectionView.delegate = self
        sandwichesCollectionView.dataSource = self
        
        getSandwiches()
    }
    
    func getSandwiches() {
        SandwicheService.shared.lanches(
            success: { lanches in
            self.lanches = lanches
            self.sandwichesCollectionView.reloadData()
        }, failure: { (error) in
            print (error ?? "")
        })
    }
    
    
    // MARK: - Delegate - Datasource CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lanches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SandwicheCollectionViewCell", for: indexPath) as! SandwicheCollectionViewCell
        cell.loadInformation(lanches[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Sandwiche selected: \(self.lanches[indexPath.row].name!)")
    }
    
    
}

