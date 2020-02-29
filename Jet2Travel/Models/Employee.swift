//
//  EmployeeDetails.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 01/03/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation

struct Employee {
    let id: String
    let name: String
    let age: String
    let salary: String
    let profileImage: String
}

extension Employee: Decodable {
    
    enum EmployeeDetailsCodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case age = "employee_age"
        case salary = "employee_salary"
        case profileImage = "profile_image"
    }
    
    init(from decoder: Decoder) throws {
        let employeeContainer = try decoder.container(keyedBy: EmployeeDetailsCodingKeys.self)
        
        id = try employeeContainer.decode(String.self, forKey: .id)
        name = try employeeContainer.decode(String.self, forKey: .name)
        age = try employeeContainer.decode(String.self, forKey: .age)
        salary = try employeeContainer.decode(String.self, forKey: .salary)
        profileImage = try employeeContainer.decode(String.self, forKey: .profileImage)
    }
}

struct EmployeeApiResponse {
    let employees: [Employee]
    let status: String
}

extension EmployeeApiResponse: Decodable {
    
    private enum EmployeeApiResponseCodingKeys: String,CodingKey {
        case employees = "data"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EmployeeApiResponseCodingKeys.self)
        
        employees = try container.decode([Employee].self, forKey: .employees)
        status = try container.decode(String.self, forKey: .status)
    }
}
