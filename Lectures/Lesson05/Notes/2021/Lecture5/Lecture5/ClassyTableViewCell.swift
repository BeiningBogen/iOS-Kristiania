//
//  ClassyTableViewCell.swift
//  Lecture5
//
//  Created by Benjamin Breiby on 06/10/2021.
//

import UIKit

class ClassyTableViewCell: UITableViewCell {
    @IBOutlet weak var titleTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
