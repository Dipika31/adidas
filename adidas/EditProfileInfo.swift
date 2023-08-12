//
//  EditProfileInfo.swift
//  adidas
//
//  Created by Choudhary Dipika on 08/08/23.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

class EditProfileInfo: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var reference : Firestore!
    //var uidText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldProperties()
        reference = Firestore.firestore()
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        //print("3",uidText)
        //addInfo(uid: uidText)
    }
    
//    func addInfo(uid:String) {
//        reference.collection("User").document(uid).updateData([
//            "name": name.text, "dob": dob.text
//        ]) { error in
//            if let error = error {
//                print("Error updating document: \(error)")
//            } else {
//                print("Document successfully updated with new field.")
//            }
//        }
//    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func setTextFieldProperties()
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: name.frame.height))
        name.borderStyle = .roundedRect
        name.layer.borderColor = UIColor.lightGray.cgColor
        name.layer.borderWidth = 1.0
        name.leftView = paddingView
        name.leftViewMode = .always
        dob.borderStyle = .roundedRect
        dob.layer.borderColor = UIColor.lightGray.cgColor
        dob.layer.borderWidth = 1.0
        dob.leftView = paddingView
        dob.leftViewMode = .always
        email.borderStyle = .roundedRect
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.layer.borderWidth = 1.0
        email.leftView = paddingView
        email.leftViewMode = .always
        password.borderStyle = .roundedRect
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 1.0
        password.leftView = paddingView
        password.leftViewMode = .always
    }
}
