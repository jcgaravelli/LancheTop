//
//  ServiceType.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 27/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Moya

enum ServiceType {
    case lanches
    case lanche
    case ingredientes
    case ingredienteDeLanche(Int?)
    case promocao
    case fazerPedido
    case verPedido
}

// MARK: - TargetType Protocol Implementation
extension ServiceType: TargetType  {
    
    var baseURL: URL { return URL(string: Constant.baseURL)! }
    var path: String {
        switch self {
        case .lanches:
            return "/lanche"
        case .lanche:
            return "/lanche/:id_sandwich"
        case .ingredientes:
            return "/ingrediente"
        case .ingredienteDeLanche:
            return "/ingrediente/de/"
        case .promocao:
            return "/promocao"
        case .verPedido:
            return "/pedido"
        case .fazerPedido:
            return "/pedido/:id_sandwich"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fazerPedido:
            return .put
        default:
            return .get
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .fazerPedido:
            return nil
        case .ingredienteDeLanche(let idLanche):
            var params: [String : AnyObject] = [:]
            params["id"] = idLanche as AnyObject
            return params
        default:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .request
    }
}
