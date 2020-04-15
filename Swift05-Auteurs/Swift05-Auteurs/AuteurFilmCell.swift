//
//  AuteurFilmCell.swift
//  Swift05-Auteurs
//
//  Created by da ghua on 2020/4/15.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class AuteurFilmCell: UITableViewCell {

    @IBOutlet weak var fileImageView: UIImageView!
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
