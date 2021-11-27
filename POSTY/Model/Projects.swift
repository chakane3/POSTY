//
//  Projects.swift
//  POSTY
//
//  Created by Chakane Shegog on 11/26/21.
//

import Foundation

struct Project: Codable {
    static func getProjects(from jsonData: Data) throws -> [Project] {
        let response = try JSONDecoder().decode(AirtableResponse.self, from: jsonData)
        return response.projectWrappers.map {$0.project}
    }
    
    let dueDate: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case dueDate = "Due date"
        case name = "Name"
    }
}

struct AirtableResponse: Codable {
    let projectWrappers: [ProjectWrapper]
    
    enum CodingKeys: String, CodingKey {
        case projectWrappers = "records"
    }
}

struct ProjectWrapper: Codable {
    let project: Project
    
    enum CodingKeys: String, CodingKey {
        case project = "fields"
    }
}



/*
 Encoding and Decoding Custom Types - CodingKeys
 
 Codable types declare a special nested enumeration named CodingKeys that conforms to the CodingKey protocol.
 with this enum we have a list of properties that must be included when instances of a codable type are encoded or decoded. The names of the enum cases should match the names you've given to the corresponding properties in your type.
 
 Basically, a coding key is a type we can use for encoding or decoding.
 */
