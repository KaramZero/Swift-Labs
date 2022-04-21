//
//  DetailsViewController.swift
//  Day6Lab1 MoviesApp
//
//  Created by Karam Ibrahim on 4/21/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import SDWebImage


class DetailsViewController: UIViewController {

    var movie :Item?
    
    @IBOutlet weak var myIMG: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieRank: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieTitle.text = movie?.header
        movieRank.text = movie?.rank
        myIMG.sd_setImage(with: URL(string: movie!.image!), placeholderImage: UIImage(named: "placeholder.png"))

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
