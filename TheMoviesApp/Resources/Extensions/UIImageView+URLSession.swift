//
//  UIImageView+URLSession.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 07/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

extension UIImageView {

    func imageFromServerURL(urlString: String, placeHolderImage: UIImage) {
        if image == nil {
            image = placeHolderImage
        }

        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil {
                return
            }

            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
