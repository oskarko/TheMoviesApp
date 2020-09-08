//
//  MovieDetails.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation

struct MovieDetails: Codable {
    let title: String
    let posterPath: String
    let sinopsis: String
    let releaseDate: String
    let originalTitle: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
    }
}
