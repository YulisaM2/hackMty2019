//
//  IVAViewController.swift
//  RetoHack
//
//  Created by Lore Ang on 8/24/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class IVAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cardTableView: UITableView!
    
    let pictures: [UIImage] = [UIImage(named: "bats.png")!, UIImage(named: "Background 2.jpg")!, UIImage(named: "Background 4.jpg")!]
    let titles: [String] = ["IVA Cobrado", "IVA Pagado", "IVA a Pagar"]
    let descriptions: [String] = ["Total de Ventas", "Total de Ventas", "Esta cantidad es una estimación aproximada basada en los datos de tu facturación"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardTableView.delegate = self
        cardTableView.dataSource = self
                // Do any additional setup after loading the view.
    }

    // How many rows in the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // Defines what cells are being used
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cableCell", for: indexPath) as! CableCell
        
        cell.configure(title: titles[indexPath.row], description: descriptions[indexPath.row])
        
        return cell
    }
    
}
