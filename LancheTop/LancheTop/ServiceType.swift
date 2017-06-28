//
//  ServiceType.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 27/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Moya

enum ServiceType {
    case lanche
}

// MARK: - TargetType Protocol Implementation
extension ServiceType: TargetType  {
    
    var baseURL: URL { return URL(string: Constant.baseURL)! }
    var path: String {
        switch self {
        case .lanche:
            return "/lanche"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    var parameters: [String: Any]? {
        return nil
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
