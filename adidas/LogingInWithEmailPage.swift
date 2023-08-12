//
//  LogingInWithEmailPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 06/08/23.
//

import UIKit

class LogingInWithEmailPage: UIViewController {

    @IBOutlet weak var emailBackView: UIView!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailBackView.layer.borderColor = UIColor.black.cgColor
        emailBackView.layer.borderWidth = 0.5

    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "VerifyAgePage") as!  VerifyAgePage
        navigate.emailText = email.text!
        navigationController?.pushViewController(navigate, animated: true)

    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
