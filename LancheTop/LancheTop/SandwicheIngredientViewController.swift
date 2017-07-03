//
//  IngredientViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 29/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class SandwicheIngredientViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sandwicheImage: UIImageView!
    @IBOutlet weak var sandwicheName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var promotionTableView: UITableView!
       
    fileprivate var lanche: Sandwiche?
    fileprivate var promocoes: [Promotion] = []
    fileprivate var ingredientes: [Ingredient] = []
    fileprivate var order: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        promotionTableView.dataSource = self
        promotionTableView.delegate = self
        promotionTableView.tableFooterView = UIView()
        
        sandwicheName.text = lanche?.name
        sandwicheImage.image = lanche?.image!.getImageWithURL()
        descriptionLabel.text = lanche?.descript
        setTotalValue((lanche?.value!)!)
        getPromotions()
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

    // Adicionar mais ingredientes
    @IBAction func AddOrRemove(_ sender: Any) {
        let addIngredientVC = self.storyboard?.instantiateViewController(withIdentifier: "IngredientListViewController") as! IngredientListViewController
        addIngredientVC.setLanche(lanche!, order: order)
        self.navigationController?.show(addIngredientVC, sender: self)
    }
    
    // Adiciona ao carrinho
    @IBAction func goCart(_ sender: Any) {
        addOrder()
        let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        cartVC.loadInformation(order)
        self.navigationController?.show(cartVC, sender: self)
    }

    // MARK: - Delegate - Datasource TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.promocoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionTableViewCell", for: indexPath) as! PromotionTableViewCell
        cell.loadInformation(self.promocoes[indexPath.row])
        return cell
    }
    
    func loadInformation(_ lanche: Sandwiche, order: [Order]) {
        self.lanche = lanche
        self.order = order
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
    
    func getPromotions() {
        PromotionService.shared.promocoes(
            success: { promocoes in
                self.promocoes = promocoes
                self.promotionTableView.reloadData()
        }, failure: { (error) in
            print (error ?? "")
        })
    }
    
    // Inserir total com promocao
    func setTotalValue(_ value: Float) {
        //Pega valor com promocao
        if isPromotion1() {
            lanche?.value = (lanche?.value)! - (0.1 * (lanche?.value)!)
        }
        lanche?.value = (lanche?.value)! - (Float(qtdPromotion2()) * 3.0)
        lanche?.value = (lanche?.value)! - (Float(qtdPromotion3()) * 1.5)
        priceLabel.text = "R$ \(lanche?.value! ?? 0.00)"
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
}
