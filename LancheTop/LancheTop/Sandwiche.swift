//
//  Sandwiche.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 26/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import ObjectMapper

class Sandwiche: Mappable {

    var id: Int?
    var name: String?
    var ingredients: [Int] = []
    var image: String?
    var value: Float?
    var descript: String?
    
    // MARK: JSON
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"] 
        self.ingredients <- map["ingredients"]
        self.image <- map["image"]
        self.value <- map["value"]
        self.descript <- map["descript"]
    }
}

