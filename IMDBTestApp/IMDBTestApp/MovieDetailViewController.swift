//
//  MovieDetailViewController.swift
//  IMDBTestApp
//
//  Created by Håkon Bogen on 08/11/2017,45.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var imdbRating: UILabel!
    @IBOutlet weak var movieDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        movieTitle.text = movie?.title
        if let rating = movie?.imdbRating {
            imdbRating.text = "\(rating)"
        }
        
        movieDescription.text = movie?.movieDescription

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
