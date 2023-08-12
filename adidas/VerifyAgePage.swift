//
//  VerifyAgePage.swift
//  adidas
//
//  Created by Choudhary Dipika on 06/08/23.
//

import UIKit

class VerifyAgePage: UIViewController {

    @IBOutlet weak var backView: UIView!
    var emailText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.borderWidth = 0.5
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func yesButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "PasswordPage") as!  PasswordPage
        navigate.receivedEmail = emailText
        navigationController?.pushViewController(navigate, animated: true)
    }
    
}
