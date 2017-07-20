//
//  TableViewCell.swift
//  Photo Base
//
//  Created by Marcin Pietrzak on 18.07.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
