//
//  DetailsScreenViewController.swift
//  lab7_q2
//
//  Created by Karam Ibrahim on 4/23/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsScreenViewController: UIViewController {

    @IBOutlet weak var movieRank: UILabel!
    
    @IBOutlet weak var movieWeeks: UILabel!
    @IBOutlet weak var movieWeekend: UILabel!
    @IBOutlet weak var movieGross: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    var movie :Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        movieTitle.text = movie?.title
        movieGross.text = movie?.gross
        movieWeeks.text = movie?.weeks
        movieWeekend.text = movie?.weekend
        movieRank.text = movie?.rank
        movieImg.kf.setImage(with: URL(string:movie?.image ?? ""), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)

        // Do any additional setup after loading the view.
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
