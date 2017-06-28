//
//  SandwicheCollectionViewCell.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 27/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class SandwicheCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var sandwicheImage: UIImageView!
    @IBOutlet weak var sandwicheName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadInformation(_ lanche: Sandwiche) {
        sandwicheName.text = lanche.name
        sandwicheImage.image = getImageWithURL(lanche.image!)
    }
    
    private func getImageWithURL(_ urlImage: String) -> UIImage {
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            return UIImage(data: data!)!
        } else {
            return UIImage()
        }
    }
    
}
