//
//  MyAccountPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 08/08/23.
//

import UIKit

class MyAccountPage: UIViewController {
    
    @IBOutlet weak var cv1: UICollectionView!
    @IBOutlet weak var logOutButton: UIButton!
    var lbl1Array = ["ORDER HISTORY","VOUCHERS","MY ACCOUNT","ADDRESS BOOK","TICKETS","NEED HELP?"]
    var lbl2Array = ["View all your orders, past and present","Easily add,view or redeem","Manage your personal details and settings","Add or editour shipping addresses","Keep track of things you're signed up for","Find FAQsor coonect with our support team"]
    var uid = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutButton.layer.borderWidth = 1
        logOutButton.layer.borderColor = UIColor.black.cgColor
    }
   
    @IBAction func cancelButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
       popToMainPage()
    }
    
    func popToMainPage() {
        MyLibrary.shared.num = 4
        if let viewControllers = self.navigationController?.viewControllers {
            if 2 < viewControllers.count {
                let targetViewController = viewControllers[0]
                self.navigationController?.popToViewController(targetViewController, animated: true)
            }
        }
    }
    
}

// MARK :- Collection View

extension MyAccountPage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv1.dequeueReusableCell(withReuseIdentifier: "AccountCvCellIdentifier", for: indexPath) as! AccountCvCellFile
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.label1.text = lbl1Array[indexPath.row]
        cell.desc.text = lbl2Array[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 2
        {
            let navigate = storyboard?.instantiateViewController(withIdentifier: "EditProfileInfoPage") as! EditProfileInfoPage
            navigate.uid1 = uid
            navigationController?.pushViewController(navigate, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 197)
    }
}
