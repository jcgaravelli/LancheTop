//
//  IngredientViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 29/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class IngredientViewController: UIViewController {
    
    @IBOutlet weak var sandwicheImage: UIImageView!
    @IBOutlet weak var sandwicheName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var carrinhoButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    fileprivate var lanche: Sandwiche?
    fileprivate var ingredientes: [Ingredient] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sandwicheName.text = lanche?.name
        sandwicheImage.image = lanche?.image!.getImageWithURL()
        descriptionLabel.text = lanche?.descript
        priceLabel.text = "R$ \(lanche?.value! ?? 0.00)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInformation(_ lanche: Sandwiche) {
        self.lanche = lanche
    }

    @IBAction func AddOrRemove(_ sender: Any) {
        let addIngredientVC = self.storyboard?.instantiateViewController(withIdentifier: "addIngredientViewController")// as! addIngredientViewController
        self.navigationController?.show(addIngredientVC!, sender: self)

    }
    
    @IBAction func goCart(_ sender: Any) {
        let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "cartViewController")// as! cartViewController
        self.navigationController?.show(cartVC!, sender: self)
    }
}
