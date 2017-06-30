//
//  PromotionService.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 28/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Moya
import ObjectMapper
import Moya_ObjectMapper

class PromotionService {
    
    static let shared = PromotionService()
    
    let provider = MoyaProvider<ServiceType>()
    
    /// Chamada de Promoções
    ///
    ///- Parameters:
    ///   - success: APllI retorna uma lista de Promoções
    ///   - failure: API retorna um erro, o chamador da função deve tratar
    func promocoes(success: @escaping (_ Sandwiche: [Promotion]) -> Void, failure: @escaping (_ error: MoyaError?) -> Void){
        provider.request(.promocao) { result in
            switch result {
            case let .success(response):
                do {
                    let promocoes = try response.mapArray(Promotion.self)
                    success(promocoes)
                } catch {
                    failure(nil)
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}
