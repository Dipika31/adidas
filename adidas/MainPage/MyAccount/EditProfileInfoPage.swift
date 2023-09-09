//
//  EditProfileInfoPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 14/08/23.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

class EditProfileInfoPage: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var reference : Firestore!
    var uid1 = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        reference = Firestore.firestore()
        printData()
        //print(MyLibrary.shared.userID)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
       saveData()
       popToMainPage()
    }
    
    func addInfo(uid:String) {
        print("--------")
        reference.collection("User").document(uid).updateData([
            "Name": name.text, "Dob": dob.text
        ]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated with new field.")
            }
        }
    }
    
    func getData(uid:String) {
        reference.collection("User").document(uid).getDocument { [self] (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                if let nameValue = data?["Name"] as? String {
                    name.text = nameValue
                    print("Field value: \(nameValue)")
                }
                if let dobValue = data?["Dob"] as? String {
                    dob.text = dobValue
                    print("Field value: \(dobValue)")
                }
                if let emailValue = data?["Email"] as? String {
                    email.text = emailValue
                    print("Field value: \(emailValue)")
                }
                if let passwordValue = data?["Password"] as? String {
                    password.text = passwordValue
                    print("Field value: \(passwordValue)")
                }
            }
            else
            {
                    print("Document does not exist")
            }
        }
    }
    
    func printData() {
        if MyLibrary.shared.num == 1
        {
            getData(uid: MyLibrary.shared.userID!)
            print(MyLibrary.shared.userID)
        }
        else
        {
            getData(uid: uid1)
            print(uid1)
        }
    }
    
    func saveData() {
        if MyLibrary.shared.num == 1
        {
            addInfo(uid: MyLibrary.shared.userID!)
            print(MyLibrary.shared.userID)
        }
        else
        {
            addInfo(uid: uid1)
            print(uid1)
        }
    }
    
    func popToMainPage() {
        MyLibrary.shared.num = 3
        if let viewControllers = self.navigationController?.viewControllers {
            if 2 < viewControllers.count {
                let targetViewController = viewControllers[0]
                self.navigationController?.popToViewController(targetViewController, animated: true)
            }
        }
    }
    
}
