//
//  MovieTableViewCell.swift
//  MovieSearchObj-C
//
//  Created by Chance Robertson on 4/28/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie = DMNMovie() {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        movieTitleLabel.text = movie.title
        ratingLabel.text = "Rating \(movie.rating)"
        overviewLabel.text = movie.overview
        DMNMovieController.fetchMovieImage(withPath: movie.posterURLString) { (image) in
            DispatchQueue.main.async {
                self.posterImageView.image = image
            }
        }
    }
}
