//
//  ProjectAPIClient.swift
//  POSTY
//
//  Created by Chakane Shegog on 11/26/21.
//

import Foundation

struct ProjectAPIClient {
    static let manager = ProjectAPIClient()
    func getProjects(completionHandler: @escaping (Result<[Project], AppError>) -> Void) {
        NetworkHelper.manager.getData(from: airtableURL) { result in
            switch result {
            case let .failure(error):
                completionHandler(.failure(error))
                return
            case let .success(data):
                do {
                    let projects = try Project.getProjects(from: data)
                    completionHandler(.success(projects))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
    private var airtableURL: URL {
        guard let url = URL(string: "https://api.airtable.com/v0/appPySJxlJPSYRDit/Design%20projects?api_key=" + SecretKey.APIKey) else {
            fatalError("Error: invald url")
        }
        return url
    }
}


