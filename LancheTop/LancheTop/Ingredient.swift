//
//  Ingredient.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 26/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import UIKit

class Ingredient: NSObject {

    var id: Int!
    var name: String!
    var price: Float!
    var image: String!
    
    override init() {
        super.init()
    }
    
    init(dict: Dictionary<String, Any>){
        super.init()
        
        self.id = dict[""] as! Int
        self.name = dict["name"] as! String
        self.price = dict[""] as! Float
        
    }
}
