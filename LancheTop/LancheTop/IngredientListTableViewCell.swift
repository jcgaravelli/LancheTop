//
//  IngredientTableViewCell.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 02/07/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class IngredientListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var qtdLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    fileprivate var delegate: IngredientListTableViewCellProtocol?
    fileprivate var lanche: Sandwiche?
    fileprivate var ingredient: Ingredient?
    fileprivate var countIngredient: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadInformation(_ ingredient: Ingredient, lanche: Sandwiche, delegate: IngredientListTableViewCellProtocol) {
        self.ingredient = ingredient
        self.lanche = lanche
        self.delegate = delegate
        
        for ingrediente in (lanche.ingredients) {
                if ingrediente == ingredient.id  {
                   
                   countIngredient = countIngredient + 1
            }
        }
        qtdLabel.text = "\(countIngredient)"
        ingredientLabel.text = ingredient.name!
        priceLabel.text = "R$ \(ingredient.price!)"
    }
    
    @IBAction func removeIngredient(_ sender: Any) {
        if countIngredient != 0 {
            countIngredient = countIngredient - 1
            qtdLabel.text = "\(countIngredient)"
            delegate?.removed(ingredient: (ingredient?.id!)!)
        }
    }
    
    @IBAction func addIngredient(_ sender: Any) {
        countIngredient = countIngredient + 1
        qtdLabel.text = "\(countIngredient)"
        delegate?.add(ingredient: (ingredient?.id!)!)
    }

}

protocol IngredientListTableViewCellProtocol: class {
    func add(ingredient: Int)
    func removed(ingredient: Int)
}
