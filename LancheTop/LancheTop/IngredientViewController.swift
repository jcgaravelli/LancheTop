//
//  IngredientViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 29/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class IngredientViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sandwicheImage: UIImageView!
    @IBOutlet weak var sandwicheName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var promotionTableView: UITableView!
       
    fileprivate var lanche: Sandwiche?
    fileprivate var promocoes: [Promotion] = []
    fileprivate var ingredientes: [Ingredient] = []

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
    
    func loadInformation(_ lanche: Sandwiche) {
        self.lanche = lanche
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

    @IBAction func AddOrRemove(_ sender: Any) {
        let addIngredientVC = self.storyboard?.instantiateViewController(withIdentifier: "addIngredientViewController")// as! addIngredientViewController
        self.navigationController?.show(addIngredientVC!, sender: self)
    }
    
    @IBAction func goCart(_ sender: Any) {
        let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "cartViewController")// as! cartViewController
        self.navigationController?.show(cartVC!, sender: self)
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
