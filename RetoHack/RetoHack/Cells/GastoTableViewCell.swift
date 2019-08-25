//
//  GastoTableViewCell.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class GastoTableViewCell: UITableViewCell {

    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var nameCompany: UILabel!
    
    @IBOutlet weak var rfcLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
