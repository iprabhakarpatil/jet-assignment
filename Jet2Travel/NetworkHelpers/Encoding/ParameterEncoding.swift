//
//  ParameterEncoding.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 29/02/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterEncoder {
    
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

