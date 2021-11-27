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
        return response.projectWrapper.map {$0.project}
    }
    
    let dueDate: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case dueDate = "Due date"
        case name = "Name"
    }
}

struct AirtableResponse: Codable {
    let projectWrapper: [ProjectWrapper]
    
    enum CodingKeys: String, CodingKey {
        case projectWrapper = "records"
    }
}


struct ProjectWrapper: Codable {
    let project: Project
    
    enum CodingKeys: String, CodingKey {
        case project = "fields"
    }
}


