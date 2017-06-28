//
//  SandwicheService.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 26/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Moya
import ObjectMapper
import Moya_ObjectMapper

class SandwicheService {
    
    static let shared = SandwicheService()
    
    let provider = MoyaProvider<ServiceType>()
    
    /// Chamada de lanches
    ///
    /// - Parameters:
    ///   - success: APllI retorna uma lista de lanches
    ///   - failure: API retorna um erro, o chamador da função deve tratar
    func lanches(success: @escaping (_ Sandwiche: [Sandwiche]) -> Void, failure: @escaping (_ error: MoyaError?) -> Void){
        provider.request(.lanches) { result in
            switch result {
            case let .success(response):
                do {
                    let lanches = try response.mapArray(Sandwiche.self)
                    success(lanches)
                } catch {
                    failure(nil)
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}

