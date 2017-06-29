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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sandwicheTableView.delegate = self
        sandwicheTableView.dataSource = self
        
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

    
    // MARK: - Delegate - Datasource TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lanches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SandwicheTableViewCell", for: indexPath) as! SandwicheTableViewCell
        cell.loadInformation(lanches[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Sandwiche selected: \(self.lanches[indexPath.row].name!)")
    }
}

