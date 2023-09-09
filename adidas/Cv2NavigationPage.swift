//
//  Cv2NavigationPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 28/08/23.
//

import UIKit

class Cv2NavigationPage: UIViewController {

    var heading = String()
    var imgArray : [String] = []
    var prize : [String] = []
    var desc = String()
    var desc1 = String()
    var select = -1
    var arr = Array<Int>()
    
    @IBOutlet weak var cv1: UICollectionView!
    @IBOutlet weak var pageTitle: UILabel!
    



    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitle.text = heading
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func navigateData(imgVar2:UIImage,priceVar2:String,desc1Var2:String,desc2Var2:String)
    {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ProductPage") as! ProductPage
        navigate.imgVar = imgVar2
        navigate.priceVar = priceVar2
        navigate.desc1Var = desc1Var2
        navigate.desc2Var = desc2Var2
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if let cell = sender.superview?.superview as? Cv2NavigationCellFile,
        let indexPath = cv1.indexPath(for: cell) {
                select = indexPath.row
                arr.append(select)
                
                cv1.reloadData()
                print(arr)
         }
    }
}

// MARK :- Collection View

extension Cv2NavigationPage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv1.dequeueReusableCell(withReuseIdentifier: "CvCellIdentifier", for: indexPath) as! Cv2NavigationCellFile
        cell.wishlistButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        cell.img.image = UIImage(named: imgArray[indexPath.row])
        cell.price.text = prize[indexPath.row]
        cell.desc1.text = desc
        cell.desc3.text = desc1
        for i in 0..<arr.count
        {
            if arr[i] == indexPath.row
            {
                print("i:",arr[i])
                print("index:",indexPath.row)
                print("--------")
                cell.wishlistImg.image = UIImage(systemName: "heart.fill")
            }
            
        }
   
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigateData(imgVar2: UIImage(named: imgArray[indexPath.row])!, priceVar2: prize[indexPath.row], desc1Var2: desc, desc2Var2: desc1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 195, height: 269)
    }
}


