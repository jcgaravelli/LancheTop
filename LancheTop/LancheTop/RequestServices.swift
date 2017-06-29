//
//  RequestServices.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 28/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Moya
import ObjectMapper
import Moya_ObjectMapper

class RequestService {
    
    static let shared = RequestService()
    
    let provider = MoyaProvider<ServiceType>()
    
    /// Chamada para ver Pedido
    ///
    ///- Parameters:
    ///   - success: APllI retorna um pedido ou uma lista de pedido 
    ///   - failure: API retorna um erro, o chamador da função deve tratar
    func verLanche(success: @escaping (_ Sandwiche: [Sandwiche]) -> Void, failure: @escaping (_ error: MoyaError?) -> Void){
        provider.request(.verPedido) { result in
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
    
//    /// Requesição de Pedido
//    ///
//    ///- Parameters:
//    ///   - success: APllI retorna um pedido ou uma lista de pedido com os ingredientes.
//    ///   - failure: API retorna um erro, o chamador da função deve tratar
//    func pedirLanches(success: @escaping (_ Sandwiche: [Sandwiche]) -> Void, failure: @escaping (_ error: MoyaError?) -> Void){
//        provider.request(.) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let lanches = try response.mapArray(Sandwiche.self)
//                    success(lanches)
//                } catch {
//                    failure(nil)
//                }
//            case let .failure(error):
//                failure(error)
//            }
//        }
//    }
}

