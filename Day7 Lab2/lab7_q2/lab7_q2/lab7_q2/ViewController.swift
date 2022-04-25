//
//  ViewController.swift
//  lab7_q2
//
//  Created by Karam Ibrahim on 4/23/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit
import CoreData
import Network
import Kingfisher

class ViewController: UITableViewController {
    var movies = [Movie]()
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                
                print("Internet connection is on.")
                
                let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_hs8g0y00")
                guard let newURL = url else{
                    print("Error while unwrapping URL")
                    return
                }
                // 2-
                let request = URLRequest(url: newURL)
                // 3-
                let session = URLSession(configuration: .default)
                
                let task = session.dataTask(with: request) { (data, response, error) in
                    // todo
                    guard let data = data else{
                        return
                    }
                    do{
                        DispatchQueue.main.async {
                            indicator.startAnimating()
                            
                        }
                        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
                        do{
                            let returnedMovies = try context.fetch(fetchRequest)
                            
                            print(returnedMovies.count)
                            
                            if(returnedMovies.count>0){
                                for i in stride(from: 0, to: returnedMovies.count, by: 1){
                                    context.delete(returnedMovies[i])
                                }
                            }
                        }catch {
                            print("can not retrive data")
                        }
                        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context)
                        let result = try JSONDecoder().decode(MyResult.self, from: data)
                        for i in 0...result.items.count-1{
                            let responseObject = result.items[i]
                            let movie = NSManagedObject(entity: entity!, insertInto: context)
                            movie.setValue(responseObject.title, forKey: "title")
                            movie.setValue(responseObject.id, forKey: "id")
                            movie.setValue(responseObject.rank, forKey: "rank")
                            movie.setValue(responseObject.image, forKey: "image")
                            movie.setValue(responseObject.weeks, forKey: "weeks")
                            movie.setValue(responseObject.weekend, forKey: "weekend")
                            movie.setValue(responseObject.gross, forKey: "gross")
                            appDelegate.saveContext()
                            
                            self.movies.append(movie as! Movie)
                            
                        }
                        
                        DispatchQueue.main.async {
                            indicator.stopAnimating()
                            self.tableView.reloadData()
                        }
                        
                    }catch let error{
                        print(error.localizedDescription)
                    }
                }
                
                task.resume()
                
                
            } else {
                print("There's no internet connection.")
                
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
                do{
                    let returnedMovies = try context.fetch(fetchRequest)
                    
                    print(returnedMovies.count)
                    
                    
                    for i in stride(from: 0, to: returnedMovies.count, by: 1){
                        self.movies.append(returnedMovies[i] as! Movie)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                    
                }catch {
                    print("can not retrive data")
                }
            }
        }
        monitor.start(queue: queue)
        
        
        
        
        
        
        
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=movies[indexPath.row].title
        cell.imageView?.kf.indicatorType = .activity
        cell.imageView?.kf.setImage(with: URL(string:movies[indexPath.row].image ?? ""), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
            let vc:DetailsScreenViewController = segue.destination as! DetailsScreenViewController
            let myIndex=tableView.indexPathForSelectedRow
            vc.movie=movies[myIndex!.row]
        
    }
    
}

