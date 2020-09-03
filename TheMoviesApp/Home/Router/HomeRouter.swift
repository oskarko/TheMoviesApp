//
//  HomeRouter.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 02/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter {
    var viewController: UIViewController {
        return makeViewController()
    }

    private var sourceView: UIViewController?

    private func makeViewController() -> UIViewController {
        let viewController = HomeViewController(nibName: "HomeViewController",
                                                bundle: Bundle.main)
        return viewController
    }

    func setSourceView(_ sourceView: UIViewController?) {
        guard let sourceView = sourceView else { fatalError("Fatal error") }

        self.sourceView = sourceView
    }
}
