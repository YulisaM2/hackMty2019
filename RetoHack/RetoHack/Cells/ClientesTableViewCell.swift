//
//  ClientesTableViewCell.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class ClientesTableViewCell: UITableViewCell {
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var clienteNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
