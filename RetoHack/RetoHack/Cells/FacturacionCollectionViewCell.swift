//
//  FacturacionCollectionViewCell.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class FacturacionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var topBar: UIView!
    
    @IBOutlet weak var amountLabel: UILabel!

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.layer.shadowRadius = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        
        // Initialization code
    }

}
