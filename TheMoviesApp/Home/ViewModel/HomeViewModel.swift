//
//  HomeViewModel.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 02/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    private weak var view: HomeViewController?
    private var router: HomeRouter?
    private var managerServices = ManagerServices()


    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router

        // Binding the router with the view
        self.router?.setSourceView(view)
    }

    func getListMovies() -> Observable<[Movie]> {
        return managerServices.getPopularMovies()
    }

    func makeDetailsView(movieID: String) {
        router?.navigateToDetailsView(movieID: movieID)
    }
}
