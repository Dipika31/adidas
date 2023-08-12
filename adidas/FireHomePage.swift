//
//  FireHomePage.swift
//  adidas
//
//  Created by Choudhary Dipika on 05/08/23.
//

import UIKit

class FireHomePage: UIViewController {

    var num = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func profileButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "LoginOptionPage") as! LoginOptionPage
        navigationController?.pushViewController(navigate, animated: true)
    }
    
}
