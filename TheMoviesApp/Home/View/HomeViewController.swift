//
//  HomeViewController.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 02/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()

        viewModel.bind(view: self, router: router)

        getData()
    }

    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "CustomMovieCell", bundle: nil),
                           forCellReuseIdentifier: "CustomMovieCell")
    }
    
    private func getData() {
        return viewModel.getListMovies()
        // Manejar la concurrencia de hilos de RxSwift
            .subscribeOn(MainScheduler.instance)
        //Subscribirme al observable
            .subscribe(
                onNext: { movies in
                    self.movies = movies
                    self.reloadTableView()
            }, onError: { error in
                print("Unknown error: " + error.localizedDescription)
            }, onCompleted: {
                // not necessary
            }).disposed(by: disposeBag)
        // Dar por completado la secuencia de RxSwift
    }

    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier:"CustomMovieCell") as! CustomMovieCell

        cell.titleMovie.text = movies[indexPath.row].title
        cell.descriptionMovie.text = movies[indexPath.row].sinopsis

        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
