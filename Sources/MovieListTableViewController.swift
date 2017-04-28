//
//  MovieListTableViewController.swift
//  MovieSearchObj-C
//
//  Created by Chance Robertson on 4/28/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies = [DMNMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMoviesWith(term: "Chance")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return MovieTableViewCell() }
        let movie = movies[indexPath.row]
        cell.movie = movie
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        getMoviesWith(term: searchTerm)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        searchBar.resignFirstResponder()
    }
    
    func getMoviesWith(term: String){
        DMNMovieController.fetchMovies(withQuery: term) { (movies) in
            guard let movies = movies else { return }
            self.movies = movies
        }
    }
}
