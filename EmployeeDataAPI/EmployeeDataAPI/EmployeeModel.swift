//
//  EmployeeModel.swift
//  EmployeeDataAPI
//
//  Created by user182438 on 11/26/20.
//

import Foundation

struct ModelEmployee: Codable {
    let id: Int
    let name: String
    let username: String
    let email : String
    let address: Address
    let phone : String
    let website: String
    let company: Company
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}

struct Geo: Codable {
    let lat, lng: String
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}


