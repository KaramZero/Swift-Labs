//
//  DetailsViewController.swift
//  Day3Lab1 MoviesApp
//
//  Created by Karam Ibrahim on 4/18/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieImage: UILabel!
    
    var movie : Movie = Movie()
       
       override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
           
           movieTitle.text = movie.title
           movieYear.text = movie.releaseYear
           movieImage.text = movie.image
           movieRating.text = movie.rating
           
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
