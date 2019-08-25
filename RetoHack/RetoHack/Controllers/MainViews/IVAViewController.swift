//
//  IVAViewController.swift
//  RetoHack
//
//  Created by Lore Ang on 8/24/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit


class IVAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    @IBOutlet weak var controlPage: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cardTableView: UITableView!
    
    let titles: [String] = ["IVA Cobrado", "IVA Pagado", "IVA a Pagar"]
    let descriptions: [String] = ["Total de Ventas", "Total de Ventas", "Esta cantidad es una estimación aproximada basada en los datos de tu facturación"]
    
    var IVATotal : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardTableView.delegate = self
        cardTableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.controlPage.hidesForSinglePage = true; self.collectionView.register(UINib(nibName: "VentasCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.collectionView.register(UINib(nibName: "VentasDetalleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell2")
        self.cardTableView.register(UINib(nibName: "IVATableViewCell", bundle: nil), forCellReuseIdentifier: "cableCell")
        APIManager.shared.getIvaTotal { (error, numero) in
            self.IVATotal = numero?.intValue
            self.cardTableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    // How many rows in the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    self.controlPage.currentPage = indexPath.section
    }

    
    // Defines what cells are being used
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cableCell", for: indexPath) as! IVATableViewCell
        
        cell.configure(title: titles[indexPath.row], description: descriptions[indexPath.row])
       
        
        switch indexPath.row {
        case 0:
            
        case 1:
        case 2:
            
        default:
            <#code#>
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VentasCollectionViewCell
           
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! VentasDetalleCollectionViewCell
            return cell
        }
    }
}
