//
//  ViewController.swift
//  Day6Lab1 MoviesApp
//
//  Created by Karam Ibrahim on 4/21/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    var movies : [Item] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movie :Item = (self.movies[indexPath.row])
        cell.textLabel?.text = movie.header
        
        cell.imageView?.sd_setImage(with: URL(string: movie.image!), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select")
        let detailsMovieVC = storyboard?.instantiateViewController(withIdentifier:"Details") as? DetailsViewController
        detailsMovieVC?.movie = movies[indexPath.row]
        navigationController?.pushViewController(detailsMovieVC!, animated: true)
    }
    

    @IBOutlet weak var myTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTable.delegate = self
        myTable.dataSource = self
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        // animator
        indicator.startAnimating()
        fetchResult { [weak self] (result) in
        // tableView.reloadData()
          DispatchQueue.main.async {
              indicator.stopAnimating()
            self?.movies = result?.items ?? []
            self?.myTable.reloadData()
          }
        }
        
        
        
    }


}

