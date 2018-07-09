//
//  ConfessionCell.swift
//  Confession
//
//  Created by Deepansh Saini on 05/01/18.
//  Copyright © 2018 Ardhendu Shekhar Mishra. All rights reserved.
//

import UIKit

class ConfessionCell: UITableViewCell {

    @IBOutlet weak var confessionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(confession: Confession){
        self.confessionLbl.text = confession.confessionDescription
    }
    
    
    
}
