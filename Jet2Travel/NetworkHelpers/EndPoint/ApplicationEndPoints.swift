//
//  ApplicationEndPoints.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 29/02/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case development
    case staging
    case production
}

public enum API {
    
    case employees
}

extension API: EndPointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment  {
        case .development: return ""
        case .staging: return ""
        case .production: return "http://dummy.restapiexample.com/api/v1/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .employees:
            return "employees"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .employees:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
