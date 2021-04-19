//
//  AddUserTableViewController.swift
//  SocialKit
//
//  Created by Euler Carvalho on 19/04/21.
//

import UIKit

class AddUserTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fields: [AddUserField] = [.name, .email]
    
    weak var delegate: AddNewUserDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addUserAction(_ sender: Any) {
        guard let nameCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? NewUserTableViewCell, let name = nameCell.fieldTextField.text else {
            return
        }
        
        guard let emailCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? NewUserTableViewCell, let email = emailCell.fieldTextField.text else {
            return
        }
        
        delegate?.addUser(name: name, email: email)
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddUserTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newUserCellIdentifier", for: indexPath) as! NewUserTableViewCell
    
        cell.bind(field: fields[indexPath.row])
        return cell
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
