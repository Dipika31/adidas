//
//  PasswordPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 07/08/23.
//

import UIKit
import Foundation
import FirebaseDatabase
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

class MyLibrary {
    static var shared = MyLibrary()
    var userID: String?
    var num: Int?
}

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
            
            self.reference.collection("User").document((authResult?.user.uid)!).setData(["Email":receivedEmail,"Password":password.text, "UID": authResult?.user.uid])
            let navigate = storyboard?.instantiateViewController(withIdentifier: "MyAccountPage") as! MyAccountPage
            MyLibrary.shared.num = 1
            MyLibrary.shared.userID = authResult?.user.uid
            print(authResult?.user.uid)
            navigationController?.pushViewController(navigate, animated: true)
        }
    }
    
    func logInId(email:String) {
        Auth.auth().signIn(withEmail: email, password: password.text!) { [self] authResult , error in
            if error == nil {
                print("Sign in")
            }
            else
            {
                print(error?.localizedDescription)
            }
            let navigate = self.storyboard?.instantiateViewController(withIdentifier: "MyAccountPage") as! MyAccountPage
            MyLibrary.shared.num = 2
            
            if let user = Auth.auth().currentUser {
            let uid1 = user.uid
                reference.collection("User").document((uid1)).getDocument { (document, error) in
                    if let document = document, document.exists {
                        navigate.uid = uid1
                        print("User UID: \(uid1)")
                    }
                    else
                    {
                        print("Document does not exist")
                    }
                }
            }
            else
            {
                print("No user is signed in")
            }
            
            self.navigationController?.pushViewController(navigate, animated: true)
        }
    }
}
