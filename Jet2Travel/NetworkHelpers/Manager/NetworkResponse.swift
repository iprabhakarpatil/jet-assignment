//
//  NetworkResponse.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 29/02/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "Authentication failed!"
    case badRequest = "Bad request!"
    case outdated = "URL request is outdated!"
    case failed = "Network Request Failed!"
    case noData = "Response returned withh no data to decode!"
    case unableToDecode = "Decoder failed to deocde the data!"
}
