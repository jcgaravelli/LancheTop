//
//  Ingredient.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 26/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import ObjectMapper

class Ingredient: Mappable {

    var id: Int?
    var name: String?
    var price: Float?
    var image: String?
    
    // MARK: JSON
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.price <- map["price"]
        self.image <- map["image"]
    }
}
