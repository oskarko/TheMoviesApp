//
//  DetailsViewModel.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation
import RxSwift

class DetailsViewModel {
    private weak var view: DetailsViewController?
    private var router: DetailsRouter?
    private var managerServices = ManagerServices()

    func bind(view: DetailsViewController, router: DetailsRouter) {
        self.view = view
        self.router = router

        // Binding the router with the view
        self.router?.setSourceView(view)
    }

    func getMovieData(movieID: String) -> Observable<MovieDetails> {
        return managerServices.getDetailsMovie(movieID: movieID)
    }
}
