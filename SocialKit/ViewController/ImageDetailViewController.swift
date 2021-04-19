//
//  ImageDetailViewController.swift
//  SocialKit
//
//  Created by Euler Carvalho on 19/04/21.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    var user: User?
    private let kBaseURL = "https://jsonplaceholder.typicode.com/photos/"
    @IBOutlet weak var tableView: UITableView!
    
    var arrImages = [UserImage]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let id = user?.id, let url = URL(string: "\(kBaseURL)\(id)/photos") else { return }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, resp, error) in
            if let response = resp as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 {
                if let users = try? JSONDecoder().decode([UserImage].self, from: data!) {
                    DispatchQueue.main.async {
                        self.arrImages = users
                    }
                }
            }
        }
        task.resume()
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ImageDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailImageTableViewCell", for: indexPath) as! DetailImageTableViewCell
        
        let image = UIImage(named: "placeholder")
        cell.imageView?.imageFromServerURL(arrImages[indexPath.row].thumbnailURL, placeHolder: image)
        return cell
    }
}



