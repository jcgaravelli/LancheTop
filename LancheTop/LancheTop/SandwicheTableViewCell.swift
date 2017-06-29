//
//  SandwicheTableViewCell.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 28/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class SandwicheTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sandwicheImage: UIImageView!
    @IBOutlet weak var sandwicheName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descritionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadInformation(_ lanche: Sandwiche) {
        sandwicheName.text = lanche.name
        sandwicheImage.image = getImageWithURL(lanche.image!)
        descritionLabel.text = lanche.ingredients.description
    
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
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
