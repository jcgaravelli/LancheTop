//
//  Promotion.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 26/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import ObjectMapper

class Promotion: Mappable {

    var id: Int?
    var name: String?
    var descript: String?
    
    // MARK: JSON
    required init?(map: Map) { }
    
    func mapping(map: Map) {        
        self.id <- map["id"]
        self.name <- map["name"]
        self.descript <- map["description"]
    }
}
