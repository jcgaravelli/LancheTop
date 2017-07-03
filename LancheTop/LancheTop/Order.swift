//
//  Order.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 30/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import ObjectMapper

class Order: Mappable {
    
    var id_sandwiche: Int?
    var name: String?
    var ingredients: [Int] = []
    var promotions: [Int] = []
    var total: Float?
    
    init() { }
    
    // MARK: JSON
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        self.id_sandwiche <- map["id_sandwiche"]
        self.name <- map["name"]
        self.ingredients <- map["ingredients"]
        self.promotions <- map["promotions"]
        self.total <- map["total"]
    }
}

