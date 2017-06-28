//
//  SandwicheViewController.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 26/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Moya

class SandwicheViewController: UIViewController {

    @IBOutlet weak var sandwicheAButton: UIButton!
    @IBOutlet weak var sandwicheBButton: UIButton!
    @IBOutlet weak var sandwicheCButton: UIButton!
    @IBOutlet weak var sandwicheDButton: UIButton!
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameLabel3: UILabel!
    @IBOutlet weak var nameLabel4: UILabel!
    
    fileprivate var lanches: [Sandwiche] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSandwiches()
    }
    
    func getSandwiches() {
        SandwicheService.shared.lanche(
            success: { lanches in
            self.lanches = lanches
            self.updateButtons()
        }, failure: { (error) in
            print (error ?? "")
        })
    }
    
    func updateButtons() {
        nameLabel1.text = lanches[0].name
        nameLabel2.text = lanches[1].name
        nameLabel3.text = lanches[2].name
        nameLabel4.text = lanches[3].name
        
        sandwicheAButton.setBackgroundImage(getImageWithURL(self.lanches[0].image!), for: .normal)
        sandwicheBButton.setBackgroundImage(getImageWithURL(self.lanches[1].image!), for: .normal)
        sandwicheCButton.setBackgroundImage(getImageWithURL(self.lanches[2].image!), for: .normal)
        sandwicheDButton.setBackgroundImage(getImageWithURL(self.lanches[3].image!), for: .normal)
    }
    
    func getImageWithURL(_ urlImage: String) -> UIImage {
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            return UIImage(data: data!)!
        } else {
            return UIImage()
        }
    }
}

