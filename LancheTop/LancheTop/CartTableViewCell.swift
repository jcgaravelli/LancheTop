//
//  OrderTableViewCell.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 30/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sandwicheImage: UIImageView!
    @IBOutlet weak var sandwicheName: UILabel!
    @IBOutlet weak var sandwicheValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadInformation(order: Order) {
        sandwicheName.text = order.name
        sandwicheValue.text = "R$ \(order.total!)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
