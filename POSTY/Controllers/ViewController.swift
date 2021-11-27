//
//  ViewController.swift
//  POSTY
//
//  Created by Chakane Shegog on 11/26/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var projectsTableView: UITableView!
    
    // bring in our projects data
    private var projects = [Project]() {
        didSet {
            projectsTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // configure the tableview here
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // load data here
    }
    
    private func configureTableView() {
        
    }
    
    // UIActivityViewController
    private func displayErrorAlert(with error: AppError) {
        let alertVC = UIAlertController(title: "Error Fetching Data", message: "\(error)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel?.text = project.name
        cell.detailTextLabel?.text = project.dueDate.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
}


