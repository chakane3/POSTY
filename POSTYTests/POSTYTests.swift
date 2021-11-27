//
//  POSTYTests.swift
//  POSTYTests
//
//  Created by Chakane Shegog on 11/26/21.
//

import XCTest
@testable import POSTY

class POSTYTests: XCTestCase {
    
//    func testGetProjects() {
//        // Arrange
//        guard let jsonPath = Bundle.main.path(forResource: "AirtableSampleResource", ofType: "json"), let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
//            fatalError("Test JSON data not found")
//        }
//
//        // Act
//        var projects = [Project]()
//        do {
//            projects = try Project.getProjects(from: jsonData)
//        } catch {
//            print(error)
//        }
//
//        // Assert
//        XCTAssertEqual(projects.count, 16, "Was expecting 16 projects, but found \(projects.count)")
//    }
    
    func testNetworkCall() {
        // arrange
        
    }

}

//https://api.airtable.com/v0/appIBfoNbzEaA72c2/Design%20projects?typecast=true&&api_key=
