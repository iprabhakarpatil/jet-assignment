//
//  EndPointType.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 29/02/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

protocol EndPointType {
    
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
