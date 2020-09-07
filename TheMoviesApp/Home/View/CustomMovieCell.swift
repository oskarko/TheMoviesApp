//
//  CustomMovieCell.swift
//  TheMoviesApp
//
//  Created by Oscar Rodriguez Garrucho on 07/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

class CustomMovieCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
