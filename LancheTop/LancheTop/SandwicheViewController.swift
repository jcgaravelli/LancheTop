//
//  SandwicheViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 26/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit
import Moya

class SandwicheViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sandwicheTableView: UITableView!
    
    fileprivate var lanches: [Sandwiche] = []
    fileprivate var ingredientes: [Ingredient] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sandwicheTableView.delegate = self
        sandwicheTableView.dataSource = self
        sandwicheTableView.tableFooterView = UIView()
        
        getIngredientes()
        getSandwiches()
    }
    
    func getSandwiches() {
        SandwicheService.shared.lanches(
            success: { lanches in
                self.lanches = lanches
                self.sandwicheTableView.reloadData()
        }, failure: { (error) in
            print (error ?? "")
        })
    }
    
    func getIngredientes() {
        IngredientService.shared.ingredientes(
            success: { ingredientes in
                self.ingredientes = ingredientes
                self.sandwicheTableView.reloadData()
        }, failure: { (error) in
            print (error ?? "")
        })
    }

    
    // MARK: - Delegate - Datasource TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lanches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SandwicheTableViewCell", for: indexPath) as! SandwicheTableViewCell
        cell.loadInformation(lanches[indexPath.row], ingredientes: self.ingredientes)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Sandwiche selected: \(self.lanches[indexPath.row].name!)")
        let cell = tableView.cellForRow(at: indexPath) as! SandwicheTableViewCell
        let ingredientesVC = self.storyboard?.instantiateViewController(withIdentifier: "IngredientViewController") as! IngredientViewController
        ingredientesVC.loadInformation(cell.getLanche())
        self.navigationController?.show(ingredientesVC, sender: self)
    }
}

