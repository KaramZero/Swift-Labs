//
//  ViewController.swift
//  DemoDay6
//
//  Created by Iti on 4/21/22.
//  Copyright © 2022 jets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        // animator
        indicator.startAnimating()
        fetchResult { [weak self] (result) in
        // tableView.reloadData()
          DispatchQueue.main.async {
              indicator.stopAnimating()
              self?.myLabel.text = "title: \(result?.items[0].header ?? "")"
          }
        }
    }


}

