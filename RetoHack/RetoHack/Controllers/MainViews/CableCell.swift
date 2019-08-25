//
//  CableCell.swift
//  RetoHack
//
//  Created by Lore Ang on 8/24/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit
import PieCharts

class CableCell: UITableViewCell, PieChartDelegate {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var chartView: PieChart!
    
    func onSelected(slice: PieSlice, selected: Bool) {
        print("Selected: \(selected), slice: \(slice)")
    }
    
    fileprivate var currentColorIndex = 0

    fileprivate func createModels() -> [PieSliceModel] {
        
        let models = [
            PieSliceModel(value: 6, color: UIColor(red: 103/256, green: 232/256, blue: 211/256, alpha: 1)),
            PieSliceModel(value: 4, color: UIColor(red: 4/256, green: 180/256, blue: 154/256, alpha: 1)),
        ]
        
        currentColorIndex = models.count
        return models
    }

    // Set up the cell
    func configure(title: String, description: String){
        
        chartView.models = [
            PieSliceModel(value: 6, color: UIColor(red: 103/256, green: 232/256, blue: 211/256, alpha: 1)),
            PieSliceModel(value: 4, color: UIColor(red: 4/256, green: 180/256, blue: 154/256, alpha: 1)),
        ]
    
        titleLabel.text = title
        descriptionLabel.text = description
    
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 8.0
        chartView.delegate = self
        chartView.models = createModels() // order is important - models have to be set at the end
    }
    
}
