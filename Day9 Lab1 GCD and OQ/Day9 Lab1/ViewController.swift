//
//  ViewController.swift
//  Day9 Lab1
//
//  Created by Karam Ibrahim on 4/27/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myIMG: UIImageView!
    let indicator = UIActivityIndicatorView(style: .large)
    
    @IBAction func oqBTN(_ sender: UIButton) {
        
        indicator.startAnimating()
        let queue = OperationQueue()
  let url = URL(string: "https://m.media-amazon.com/images/M/MV5BNWE4ODBjNDItYTE1MC00ODg1LTg5MzUtZDRkY2ZiZjQyYTgzXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_Ratio0.6716_AL_.jpg")
        let block1 = BlockOperation{
            do{
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async { [weak self]in
                    self!.myIMG.image = UIImage(data: data)
                }
            }catch{
                print("Error...........")
            }
        }
        let block2 = BlockOperation{
            DispatchQueue.main.async { [weak self] in
                self!.indicator.stopAnimating()
            }
        }
        
        block2.addDependency(block1)
        queue.addOperations([block1, block2], waitUntilFinished: false)
    }
        
        
    @IBAction func loadBTN(_ sender: UIButton) {
        indicator.startAnimating()
        let url = URL(string: "https://miro.medium.com/max/6018/1*3rewUBdM1VKZrBGd7UDoFA.png")
        guard let myURL = url else {
            return
        }
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: myURL)
                DispatchQueue.main.async {
                    [weak self] in
                    self?.myIMG.image = UIImage(data: data)
                    self?.indicator.stopAnimating()
                }
            }catch let err as NSError{
                print(err.localizedDescription)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
               indicator.center = self.view.center
               self.view.addSubview(indicator)
    }


}

