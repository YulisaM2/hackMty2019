//
//  VentasDetalleCollectionViewCell.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 25/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class VentasDetalleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var imagenVenta: UIImageView!
    @IBOutlet weak var descriptionVenta: UILabel!
    @IBOutlet weak var company: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        // Initialization code
    }

}
