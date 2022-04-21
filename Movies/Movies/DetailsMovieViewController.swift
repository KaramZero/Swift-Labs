//
//  DetailsMovieViewController.swift
//  Movies
//
//  Created by Karam Ibrahim on 4/20/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class DetailsMovieViewController: UIViewController {

    @IBOutlet var labelGenre: UILabel!
    @IBOutlet var labelReleseYear: UILabel!
    @IBOutlet var labelRating: UILabel!
    @IBOutlet var imageMovie: UIImageView!
    @IBOutlet var labelTitle: UILabel!
    var movie :Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = movie?.title
        labelRating.text = String(movie?.rating ?? 0)
        let decodedData = Data(base64Encoded: movie!.image, options: .ignoreUnknownCharacters)
        imageMovie.image = UIImage(data: decodedData!)
        labelGenre.text = movie!.genre.joined(separator: " , ")
        labelReleseYear.text = String(movie?.releseYear ?? 0)
        
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
