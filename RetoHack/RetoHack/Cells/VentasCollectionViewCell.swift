//
//  VentasCollectionViewCell.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 25/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class VentasCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var clientes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        // Initialization code
    }

}
