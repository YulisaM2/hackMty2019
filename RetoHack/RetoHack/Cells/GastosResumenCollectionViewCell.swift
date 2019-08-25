//
//  GastosResumenCollectionViewCell.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class GastosResumenCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var imageGasto: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var costumer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 7
        self.clipsToBounds = true
        // Initialization code
    }

}
