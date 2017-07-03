//
//  CartViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 30/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var cartTableView: UITableView!
    fileprivate var order: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
    
    func loadInformation(_ order: [Order]) {
        self.order = order
    }

    @IBAction func addOrder(_ sender: Any) {
        let sandwicheVC = self.storyboard?.instantiateViewController(withIdentifier: "SandwicheViewController") as! HomeSandwicheViewController
        sandwicheVC.setupOrder(order: order)
        self.navigationController?.show(sandwicheVC, sender: self)
    }
    
    // MARK: - Delegate - Datasource TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.loadInformation(order: self.order[indexPath.row])
        return cell
    }
}
