//
//  TableViewController.swift
//  Day2Lab2 MoviesApp
//
//  Created by Karam Ibrahim on 4/17/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController ,AddMovieProtocol {
    func addMovie(movie: Movie) {
        movies.append(movie)
        tableView.reloadData()
        
    }
    
//    var data : Data = Data()
//    let requestURL: NSURL = NSURL(string:"https://api.androidhive.info/json/movies.json")!
    
    var movies :Array = [Movie]()
    var detailsView : DetailsViewController!
    var addView : AddMovieViewController!
    
    
    @IBAction func adddddd(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "addMovie") as! AddMovieViewController
               vc.homeView = self
               navigationController?.pushViewController(vc, animated: true)
           
        
    }
    
    
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
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = movies[indexPath.row].title
        cell.detailTextLabel?.text = movies[indexPath.row].image

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailsView.movie = movies[indexPath.row]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
    

}
