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
    case lanche(id_sandwiche: Int)
    case ingredientes
    case ingredienteDeLanche(id_sandwiche: Int)
    case promocao
    case verPedido
    case fazerPedido(id_sandwiche: Int)
    
}

// MARK: - TargetType Protocol Implementation
extension ServiceType: TargetType  {
    
    var baseURL: URL { return URL(string: Constant.baseURL)! }
    var path: String {
        switch self {
        case .lanches:
            return "/lanche"
        case .lanche(let id_sandwiche):
            return "/lanche/\(id_sandwiche)"
        case .ingredientes:
            return "/ingrediente"
        case .ingredienteDeLanche(let id_sandwiche):
            return "/ingrediente/de/\(id_sandwiche)"
        case .promocao:
            return "/promocao"
        case .verPedido:
            return "/pedido"
        case .fazerPedido(let id_sandwiche):
            return "/pedido/\(id_sandwiche)"
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
