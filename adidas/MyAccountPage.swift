//
//  MyAccountPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 08/08/23.
//

import UIKit

class MyAccountPage: UIViewController {

    //var uidText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func profileButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "EditProfileInfo") as! EditProfileInfo
//        navigate.uidText = uidText
//        print("2",uidText)
    navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        if let viewControllers = navigationController?.viewControllers, viewControllers.count > 0 {
            navigationController?.popToViewController(viewControllers[0], animated: true)
        }
    }
    
}
