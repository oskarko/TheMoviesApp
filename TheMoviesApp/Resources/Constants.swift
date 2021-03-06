//
//  Constants.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 03/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation

struct Constants {
    static let apiKey = "?api_key=b0f738f8029848610c5615829c48ef8c"

    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }

    struct Endpoints {
        static let urlListPopularMovies = "3/movie/popular"
        static let urlDetailsMovie = "3/movie/"
    }
}
