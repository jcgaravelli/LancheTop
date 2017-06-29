//
//  IngredientService.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 28/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Moya
import ObjectMapper
import Moya_ObjectMapper

class IngredientService {
    
    static let shared = IngredientService()
    
    let provider = MoyaProvider<ServiceType>()
    
    /// Chamada de Ingredientes
    ///
    ///- Parameters:
    ///   - success: APllI retorna uma lista de Ingredientes
    ///   - failure: API retorna um erro, o chamador da função deve tratar
    func ingredientes(success: @escaping (_ Sandwiche: [Ingredient]) -> Void, failure: @escaping (_ error: MoyaError?) -> Void){
        provider.request(.ingredientes) { result in
            switch result {
            case let .success(response):
                do {
                    let ingredientes = try response.mapArray(Ingredient.self)
                    success(ingredientes)
                } catch {
                    failure(nil)
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}

