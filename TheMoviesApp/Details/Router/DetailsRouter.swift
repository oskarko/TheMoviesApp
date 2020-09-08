//
//  DetailsRouter.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation
import UIKit

class DetailsRouter {
    var viewController: UIViewController {
        return makeViewController()
    }

    private var movieID: String?
    private var sourceView: UIViewController?

    init(movieID: String? = "") {
        self.movieID = movieID
    }

    private func makeViewController() -> UIViewController {
        let viewController = DetailsViewController(nibName: "DetailsViewController",
                                                bundle: Bundle.main)
        viewController.movieID = movieID
        return viewController
    }

    func setSourceView(_ sourceView: UIViewController?) {
        guard let sourceView = sourceView else { fatalError("Fatal error") }

        self.sourceView = sourceView
    }
}
