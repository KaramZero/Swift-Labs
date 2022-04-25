//
//  DetailsScreen.swift
//  lab2_q2
//
//  Created by Karam Ibrahim on 4/23/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class DetailsScreen: UIViewController {
    
    var movie:Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLable: UILabel!
    
    @IBOutlet weak var imgMovie: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text=movie?.title
              yearLabel.text = String(movie!.releaseYear)//String(mov?.releaseYear ?? "2020")
              ratingLabel.text=String(movie!.rating)
        genreLable.text=String( movie!.genre!)
    
        let imagee: UIImage = UIImage(data:(movie?.image)!,scale:1.0)!
            
        imgMovie.image = imagee
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
