//
//  NetworkRouter.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 29/02/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
