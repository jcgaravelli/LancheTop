//
//  PromotionTableViewCell.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 30/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descritionLabel: UILabel!
    
    fileprivate var promotion: Promotion?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadInformation(_ promotion: Promotion) {
        self.promotion = promotion
        
        titleLabel.text = promotion.name
        descritionLabel.text = promotion.descript
        
    }
    
    func getPromotion() -> Promotion {
        return self.promotion!
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
