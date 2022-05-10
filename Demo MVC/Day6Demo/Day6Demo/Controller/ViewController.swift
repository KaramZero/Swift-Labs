//
//  ViewController.swift
//  Day6Demo
//
//  Created by Iti on 1/13/22.
//  Copyright © 2022 jets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //var NWService : MovieService!
    var result : [Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        //NWService = NetworkService()
        
        NetworkService.fetchResult { [weak self] (result) in
            
            print(result?.items[0].header ?? "")
            self?.result = result?.items
            //self.tableView.reloadData()
            DispatchQueue.main.async {
                indicator.stopAnimating()
                //self.label?.text = result.items[0].header ?? ""
            }
        }
        
    }


}

