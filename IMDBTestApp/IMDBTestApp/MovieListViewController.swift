//
//  ViewController.swift
//  IMDBTestApp
//
//  Created by Håkon Bogen on 25/10/2017,43.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//
import UIKit
import CoreData

        // https://raw.githubusercontent.com/BeiningBogen/iOS-Westerdals/master/movies.json

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        fetchMovies()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let url = URL.init(string: "https://raw.githubusercontent.com/BeiningBogen/iOS-Westerdals/master/movies.json")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let actualData = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: actualData, options: .allowFragments) as? [[String : Any]] {
                        print(json)
                        var tempMovies = [Movie]()
                        for movieDict in json {
                            
                            if let movie = Movie.fetchOrInsert(attributes: movieDict, managedObjectContext: appDelegate.persistentContainer.viewContext) {
                                
                                tempMovies.append(movie)
                                
                            }
                            
                        }
                        
                        DispatchQueue.main.async {
                            
                            self.movies = tempMovies
                            self.tableView.reloadData()
                            
                        }
                        appDelegate.saveContext()

                    }
                } catch let error {
                    print(error)
                }
            }
            
            print(error)
        }
        
        task.resume()
    }
    
    func fetchMovies() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        do {
            movies = try appDelegate.persistentContainer.viewContext.fetch(Movie.movieFetchRequest())
            tableView.reloadData()
        } catch let error {
            print(error)
        }
    }
    
    func addMovie() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Movie", in: appDelegate.persistentContainer.viewContext)
        
        let movie = Movie(entity: entityDescription!, insertInto: appDelegate.persistentContainer.viewContext)
        
        movie.title = "Star Wars"
        movie.movieID = "1"
        movie.imdbRating = 9.7
        
        appDelegate.saveContext()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailViewController = segue.destination as? MovieDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
            
            let movie = movies[indexPath.row]
            detailViewController.movie = movie
            
        }
    }

}

extension MovieListViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.titleLabel.text = movie.title
        cell.imdbRatingLabel.text = "\(movie.imdbRating)"

        return cell
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
}















