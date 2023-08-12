//
//  LoginOptionPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 05/08/23.
//

import UIKit

class LoginOptionPage: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var showView: UIView!
    @IBOutlet weak var logInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.layer.cornerRadius = 10
        logInButton.layer.borderWidth = 1
        logInButton.layer.borderColor = UIColor.black.cgColor
        showView.layer.cornerRadius = 5
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "LogInWithEmailPage") as!  LogInWithEmailPage
        navigationController?.pushViewController(navigate, animated: true)
    }
}
