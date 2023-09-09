//
//  WishlistPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 17/08/23.
//

import UIKit

class WishlistPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func startShoppingButton(_ sender: UIButton) {
       switchTabAndPopToViewController()
    }
    
    
    @IBAction func profileButton(_ sender: UIButton) {
        if MyLibrary.shared.num == 3
        {
            let navigate = storyboard?.instantiateViewController(withIdentifier: "MyAccountPage") as! MyAccountPage
            navigationController?.pushViewController(navigate, animated: true)
        }
        else
        {
            let navigate = storyboard?.instantiateViewController(withIdentifier: "LoginOptionPage") as! LoginOptionPage
            navigationController?.pushViewController(navigate, animated: true)
        }
    }
    
    func switchTabAndPopToViewController() {
        if let tabBarController = self.tabBarController {
            
            let targetTabIndex = 1
            
            if targetTabIndex < tabBarController.viewControllers?.count ?? 0 {
                tabBarController.selectedIndex = targetTabIndex
                if let navigationController = tabBarController.selectedViewController as? UINavigationController {
                    navigationController.popToRootViewController(animated: true)
                }
            }
        }
    }

}
