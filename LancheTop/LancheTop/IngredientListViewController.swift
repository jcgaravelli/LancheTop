//
//  IngredientListViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 02/07/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit
import Moya

class IngredientListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ingredientListTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    fileprivate var lanche: Sandwiche?
    fileprivate var ingredientes: [Ingredient] = []
    fileprivate var order: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        ingredientListTableView.delegate = self
        ingredientListTableView.dataSource = self
        
        getIngredientes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getIngredientes() {
        IngredientService.shared.ingredientes(
            success: { ingredientes in
                self.ingredientes = ingredientes
                self.ingredientListTableView.reloadData()
                self.setTotalValue()
        }, failure: { (error) in
            print (error ?? "")
        })
    }
    
    func setLanche(_ lanche: Sandwiche, order: [Order]){
        self.lanche = lanche
        self.order = order
    }
    
    func addOrder() {
        let newOrder: Order = Order()
        newOrder.id_sandwiche = lanche?.id
        newOrder.name = lanche?.name
        newOrder.ingredients = (lanche?.ingredients)!
        newOrder.total = lanche?.value
        newOrder.promotions = getArrayPromotions()
        order.append(newOrder)
    }

    // MARK: - Delegate - Datasource TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientListTableViewCell", for: indexPath) as! IngredientListTableViewCell
        cell.loadInformation(ingredientes[indexPath.row], lanche: lanche!, delegate: self)
        return cell
    }
    
    // Inserir total com promocao
    func setTotalValue() {
        var price: Float = 0.0
        for ingrediente in (lanche?.ingredients)! {
            for ingrediteLista in ingredientes {
                if ingrediente == ingrediteLista.id {
                    price = ingrediteLista.price! + price
                }
            }
        }
        
        //Pega valor com promocao
        if isPromotion1() {
            price = price - (0.1 * price)
        }
        price = (price) - (Float(qtdPromotion2()) * 3.0)
        price = (price) - (Float(qtdPromotion3()) * 1.5)
        
        self.lanche?.value = price
        titleLabel.text = "R$ \(lanche?.value! ?? 0.00)"
    }
    
    
    // Esta com alguma promoção?
    func isPromotion1() -> Bool {
        var hasBacon = false
        var hasSalad = false
        
        for item in (self.lanche?.ingredients)! {
            if item == 1 {
                hasSalad = true
            }
            if item == 2 {
                hasBacon = true
            }
        }
        return !hasBacon && hasSalad
    }
    
    func qtdPromotion2() -> Int {
        var count = 0
        for item in (self.lanche?.ingredients)! {
            if item == 3 {
                //possue carne (Hamburguer?)
                count = count + 1
            }
        }
        return Int(round(Double(count / 3)))
    }
    
    func qtdPromotion3() -> Int {
        var count = 0
        for item in (self.lanche?.ingredients)! {
            if item == 5 {
                //possue queijo
                count = count + 1
            }
        }
        return Int(round(Double(count / 3)))
    }
    
    func getArrayPromotions() -> Array<Int> {
        var promotions: Array<Int> = []
        if isPromotion1() {
            promotions.append(1)
        }
        for _ in (0..<qtdPromotion2()) {
            promotions.append(2)
        }
        for _ in (0..<qtdPromotion3()) {
            promotions.append(3)
        }
        
        return promotions
    }

    @IBAction func goCart(_ sender: Any) {
        addOrder()
        let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        cartVC.loadInformation(order)
        self.navigationController?.show(cartVC, sender: self)
    }
    
}


extension IngredientListViewController: IngredientListTableViewCellProtocol {
    
    func add(ingredient: Int) {
        lanche?.ingredients.append(ingredient)
        setTotalValue()
    }
    
    func removed(ingredient: Int) {
        lanche?.ingredients.removeFirstEqualItem(item: ingredient)
        setTotalValue()
    }
}


