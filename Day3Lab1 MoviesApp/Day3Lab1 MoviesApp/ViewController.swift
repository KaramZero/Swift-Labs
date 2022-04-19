//
//  ViewController.swift
//  Day3Lab1 MoviesApp
//
//  Created by Karam Ibrahim on 4/18/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var myTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        detailsView.movie = movies[indexPath.row]

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

                      // Configure the cell...
                      
                      cell.textLabel?.text = movies[indexPath.row].title
                      cell.detailTextLabel?.text = movies[indexPath.row].image

                      return cell    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "add":
            addView = segue.destination as? AddMovieViewController

        case "details":
            detailsView = segue.destination as? DetailsViewController
        default:
            return
        }
        
    }
    

    var movies :Array = [Movie]()
    var detailsView : DetailsViewController!
    var addView : AddMovieViewController!
    
    override func viewDidLoad() {
           super.viewDidLoad()


           for i in 0...10{
               var m = Movie()
               m.title = " Movie num \(i)"
               m.image = " Movie image url \(i)"
               m.rating = " Movie rating \(i)"
               m.releaseYear = " Movie year \(i)"
               
               movies.append(m)
           }
        
        //myTable.reloadData()
    }
        
}

