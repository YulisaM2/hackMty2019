//
//  TabBar.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor(red: 4/255, green: 180/255, blue: 154/255, alpha: 1)
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor =  UIColor(red: 103/255, green: 232/255, blue: 211/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
