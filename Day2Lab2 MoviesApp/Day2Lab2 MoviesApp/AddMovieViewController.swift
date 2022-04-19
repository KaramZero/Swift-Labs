//
//  AddMovieViewController.swift
//  Day2Lab2 MoviesApp
//
//  Created by Karam Ibrahim on 4/18/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieYear: UITextField!
    @IBOutlet weak var movieRating: UITextField!
    @IBOutlet weak var movieImage: UITextField!
    
    var homeView : AddMovieProtocol!
    
    @IBAction func confirm(_ sender: UIButton) {
        var m = Movie()
        m.title = movieTitle.text!
        m.image = movieImage.text!
        m.rating = movieRating.text!
        m.releaseYear = movieYear.text!
        
        
        homeView.addMovie(movie: m)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
