//
//  AuteursListCell.swift
//  Swift05-Auteurs
//
//  Created by da ghua on 2020/4/9.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class AuteursListCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
