//
//  DetailsViewController.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 07/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit
import RxSwift

class DetailsViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var originalTitleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var sinopsisLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!

    var movieID: String?

    private var router = DetailsRouter()
    private var viewModel = DetailsViewModel()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
        getDataAndShowMovieDetails()
    }

    func getDataAndShowMovieDetails() {
        guard let idMovie = movieID else { return }

        return viewModel.getMovieData(movieID: idMovie)
            .subscribe(onNext: { movieDetails in
                self.showMovieDetails(movie: movieDetails)
            }, onError: { error in
                print("Unknown error: " + error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }

    func showMovieDetails(movie: MovieDetails) {
        DispatchQueue.main.async {
            self.titleLabel.text = movie.title
            self.originalTitleLabel.text = movie.originalTitle
            self.releaseDateLabel.text = movie.releaseDate
            self.voteAverageLabel.text = "\(movie.voteAverage)"
            self.sinopsisLabel.text = movie.sinopsis
            self.posterImageView
                .imageFromServerURL(urlString: Constants.URL.urlImages + movie.posterPath,
                                    placeHolderImage: UIImage(named: "claqueta")!)
        }
    }

}
