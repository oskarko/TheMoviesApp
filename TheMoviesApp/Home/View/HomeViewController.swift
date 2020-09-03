//
//  HomeViewController.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 02/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private var router = HomeRouter()
    private var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
    }

}
