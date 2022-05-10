//
//  HomeTableViewController.swift
//  MVVM
//
//  Created by Karam Ibrahim on 5/9/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher


class HomeTableViewController: UITableViewController {

    var list : [Result] = []
    
    var item : Result?
    
    var viewModel : HomeViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        
        indicator.startAnimating()
        
        viewModel = HomeViewModel(service: NetworkManager.networkManagerInstance)
        viewModel.bindResultToHomeView = {
            [weak self] in
            DispatchQueue.main.async{
                indicator.stopAnimating()
                self?.updateUI()
            }
        }
        viewModel.getItems()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let movie = list[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = "Rank: \(indexPath.row + 1)"
    
        cell.imageView?.kf.setImage(with: URL(string : list[indexPath.row].image!), placeholder: UIImage(named:"apple.png"))
        
        
        return cell
    }
}

extension HomeTableViewController : HomeViewCommunicator{
    func updateUI() {
        self.list = viewModel.result ?? []
        self.tableView.reloadData()
    }
}
