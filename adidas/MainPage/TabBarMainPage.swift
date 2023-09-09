//
//  TabBarMainPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 05/08/23.
//

import UIKit

class TabBarMainPage: UITabBarController {
    
    var category = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        FireHomePage.category = category
    }
    

}
