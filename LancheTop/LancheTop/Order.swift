//
//  Order.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 30/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import ObjectMapper

class Order: Mappable {
    
    var id: Int?
    var sandwiches: [Sandwiche]?
    var ingredients: [Int] = []
    var promotion: Promotion?
    var total: Double?
    
    // MARK: JSON
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.sandwiches <- map["sandwiches"]
        self.ingredients <- map["ingredients"]
        self.promotion <- map["promotion"]
        self.total <- map["total"]
    }
}

//lanche.ingredients.append(id_ingredient)
//lanche.ingredients = lanche.ingredients.removeFirstEqualItem(id_ingredient)
