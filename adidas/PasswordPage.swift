//
//  PasswordPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 07/08/23.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

class PasswordPage: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logIn: UIButton!
    var reference : Firestore!
    var receivedEmail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reference = Firestore.firestore()
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.borderWidth = 0.5
        logIn.layer.borderWidth = 1
        logIn.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        signUp(email: receivedEmail)
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        logInId(email: receivedEmail)
    }
    
    func signUp(email:String) {
        Auth.auth().createUser(withEmail: email, password: password.text!) { [self] authResult, error in
            print(authResult,error?.localizedDescription)
            
            self.reference.collection("User").document((authResult?.user.uid)!).setData(["Email":receivedEmail])
//            var uidText = authResult?.user.uid
//            print("1",uidText)
            let navigate = storyboard?.instantiateViewController(withIdentifier: "MyAccountPage") as! MyAccountPage
            //navigate.uidText = uidText!
            navigationController?.pushViewController(navigate, animated: true)
        }
    }
    
    func logInId(email:String) {
        Auth.auth().signIn(withEmail: email, password: password.text!) { authResult , error in
            if error == nil {
                print("Sign in")
            }
            else
            {
                print(error?.localizedDescription)
            }
//            var uidText = authResult?.user.uid
//            print("1",uidText)
            let navigate = self.storyboard?.instantiateViewController(withIdentifier: "MyAccountPage") as! MyAccountPage
//            navigate.uidText = uidText!
            self.navigationController?.pushViewController(navigate, animated: true)
        }
    }
}
