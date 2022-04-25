//
//  ViewController.swift
//  lab2_q2
//
//  Created by Karam Ibrahim on 4/23/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UITableViewController,AddProtocol  {
  
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
     //     let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        do{
            let ReturnedMovies = try context.fetch(fetchRequest)
            print(ReturnedMovies.count)
           
            for i in stride(from: 0, to: ReturnedMovies.count, by: 1){
                movies.append(ReturnedMovies[i] as! Movie)
                tableView.reloadData()
            }
          
            }catch {
                print("can not retrive data")
            }
        
        
        
        
    }

    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      print("Deleted")
        let deletedMovie = String(movies[indexPath.row].title ?? "")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
              let context = appDelegate.persistentContainer.viewContext
        context.delete(movies[indexPath.row])
        do{
        try context.save()
        }
        catch{
            print("can not delete")
        }
        movies.remove(at: indexPath.row)
      tableView.reloadData()

    }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text=movies[indexPath.row].title
        let imagee: UIImage = UIImage(data:(movies[indexPath.row].image)!,scale:1.0)!
        cell.imageView?.image = imagee
            return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "display" {
            let vc:DetailsScreen = segue.destination as! DetailsScreen
            let myIndex=tableView.indexPathForSelectedRow
                vc.movie=movies[myIndex!.row]         } else if segue.identifier == "addMovie" {
            let second:AddMovie = segue.destination as! AddMovie
            second.firstVC = self
            
         }
     
        
      }
    
    func getMovie(movie : Movie) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do{
            try context.save()
            print("data added successfully")
        }catch{
            print("Error")
        }
        movies.append(movie)
        self.tableView.reloadData()

    }


}

