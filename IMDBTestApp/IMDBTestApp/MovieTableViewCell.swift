//
//  MovieTableViewCell.swift
//  IMDBTestApp
//
//  Created by Håkon Bogen on 25/10/2017,43.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var imdbRatingLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
