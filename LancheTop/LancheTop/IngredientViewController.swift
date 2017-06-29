//
//  IngredientViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 29/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class IngredientViewController: UIViewController {
    
    fileprivate var ingredientes: [Ingredient] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getIngredients() {
        IngredientService.shared.ingredientes(
            success: { ingredientes in
                self.ingredientes = ingredientes
                //self.sandwicheTableView.reloadData()
        }, failure: { (error) in
            print (error ?? "")
        })
    }
}
