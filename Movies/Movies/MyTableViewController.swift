//
//  MyTableViewController.swift
//  Movies
//
//  Created by Karam Ibrahim on 4/20/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController ,AddMovieProtocal{
    
   
    @IBOutlet var myTable: UITableView!
    
    
    var moviesList :[Movie] = []
    var dbManager :DBManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbManager = DBManager.dbManger
        
       let createTableString = """
        create table if not exists Movie(
        title char(255) primary key not null,
        image char(500),
        rating double ,
        releseYear int ,
        genre char(1000)
        )
        """
        dbManager?.createTablecreateTableString(createTableString: createTableString)
        
      
        
     let queryStatementString = "SELECT * FROM Movie;"
        moviesList = (dbManager?.query(queryStatementString: queryStatementString))!
        print("seleced \(moviesList.count) movies")

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        let movie :Movie = (self.moviesList[indexPath.row])
        cell.textLabel?.text = movie.title
        let decodedData = Data(base64Encoded: movie.image, options: .ignoreUnknownCharacters)
        cell.imageView?.image = UIImage(data:decodedData!)
     
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsMovieVC = storyboard?.instantiateViewController(withIdentifier:"details") as? DetailsMovieViewController
        detailsMovieVC?.movie = moviesList[indexPath.row]
        navigationController?.pushViewController(detailsMovieVC!, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        let deleteStatementString = "DELETE FROM Movie WHERE title = ?;"
        dbManager?.delete(deleteStatementString: deleteStatementString,movie: moviesList[indexPath.row])
        moviesList.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
         
      }
    }
    
    @IBAction func btnAdd(_ sender: UIBarButtonItem) {
        let addMovieVC = storyboard?.instantiateViewController(withIdentifier:"add") as? AddMovieViewController
        addMovieVC?.myTableVC = self
    navigationController?.pushViewController(addMovieVC!, animated: true)
    }
  

    
    func addMovie(movie: Movie) {
        moviesList.append(movie)
        myTable.reloadData()
        let insertStatementString = "INSERT INTO Movie (title, image , rating , genre,releseYear) VALUES (?,?,?,?,?);"
        dbManager?.insert(insertStatementString: insertStatementString, movie: movie)
       
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
