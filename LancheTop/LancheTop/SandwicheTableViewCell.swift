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
    
    fileprivate var lanche: Sandwiche?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadInformation(_ lanche: Sandwiche, ingredientes: [Ingredient]) {
        self.lanche = lanche
        var description = "Ingredientes:"
        var price: Float = 0.0
        sandwicheName.text = lanche.name
        sandwicheImage.image = lanche.image!.getImageWithURL()
        
        for ingrediente in lanche.ingredients {
            for ingrediteLista in ingredientes {
                if ingrediente == ingrediteLista.id {
                    description = "\(description)\n • \(ingrediteLista.name!)"
                    price = ingrediteLista.price! + price
                }
            }
        }
        descritionLabel.text = description
        priceLabel.text = "R$ \(price)"
        
        self.lanche?.value = price
        self.lanche?.descript = description
    }
    
    func getLanche() -> Sandwiche {
        return self.lanche!
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
