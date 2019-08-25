//
//  GastosCollectionViewCell.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class GastosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var numeroProveedores: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        // Initialization code
    }

}
