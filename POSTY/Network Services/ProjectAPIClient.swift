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
        NetworkHelper.manager.performDataTask(withUrl: airtableURL, andMethod: .get) { result in
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
    
    func post(_ project: Project, completionHandler: @escaping (Result<Data, AppError>) -> Void) {
        let projectWrapper = ProjectWrapper(project: project)
        guard let encodedProjectWrapper = try? JSONEncoder().encode(projectWrapper) else {
            fatalError("Unable to encode json project")
        }
        print(String(data: encodedProjectWrapper, encoding: .utf8)!)
        NetworkHelper.manager.performDataTask(withUrl: airtableURL, andHTTPBody: encodedProjectWrapper, andMethod: .post, completionHandler: { result in
            switch result {
            case let .success(data):
                completionHandler(.success(data))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        })
    }
    
    private var airtableURL: URL {
        guard let url = URL(string: "https://api.airtable.com/v0/appPySJxlJPSYRDit/Design%20projects?api_key=" + SecretKey.APIKey) else {
            fatalError("Error: invald url")
        }
        return url
    }
    private init() {}
}


