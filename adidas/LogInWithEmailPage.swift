//
//  LogInWithEmailPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 06/08/23.
//

import UIKit

class LogInWithEmailPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func emailButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "LogingInWithEmailPage") as!  LogingInWithEmailPage
        navigationController?.pushViewController(navigate, animated: true)
    }
}
