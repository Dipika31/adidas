//
//  FireHomePage.swift
//  adidas
//
//  Created by Choudhary Dipika on 05/08/23.
//

import UIKit

class FireHomePage: UIViewController {
    
    static var category = String()
    var cv1Label = ["WOMEN'S","ORIGINALS","CRICKET","YEEZY","RUNNING","TENNIS","BASKETBALL","SPORTSWEAR"]
    var cv2Img = ["original","cricket","yeezy","running","tennis","basket","sports"]
    var cv2label = ["ORIGINALS","CRICKET","YEEZY","RUNNING","TENNIS","BASKETBALL","SPORTSWEAR"]
    var cv2Label2 = ["INTERNATIONAL ICONS","JUST DROPPED","16 AUG - 22 AUG 2023","SWITCH RWD","NEW TENNIS COLLECTION","THE 2023 COLLECTION: CHAPTER...","Z.N.E. SPORTSWEAR"]
    var cv2OriginalImg = ["o1","o2","o3","o4","o5","o6","o7","o10"]
    var cv2CricketImg = ["c1","c2","c3","c4","c5","c6","c7","c8","c9","c10"]
    var cv2YeezyImg = ["yeezy1","yeezy2","yeezy3","yeezy4","yeezy5","yeezy6","yeezy7","yeezy8","yeezy9","yeezy10"]
    var cv2RunningImg = ["run1","run2","run3","run4","run5"]
    var cv2TennisImg = ["tennis1","tennis2","tennis3","tennis4","tennis5"]
    var cv2BasketImg = ["basket1","basket2","basket3","basket4","basket5"]
    var cv2SportsImg = ["sport1","sport2","sport3","sport4","sport5"]
    var prize = ["₹2999","₹1999","₹3999","₹999","₹699","₹899","₹399","₹599","₹799","₹1999"]
    var abc : [String] = []
   
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func profileButton(_ sender: UIButton) {
        if MyLibrary.shared.num == 3
        {
            let navigate = storyboard?.instantiateViewController(withIdentifier: "MyAccountPage") as! MyAccountPage
            navigationController?.pushViewController(navigate, animated: true)
        }
        else
        {
            let navigate = storyboard?.instantiateViewController(withIdentifier: "LoginOptionPage") as! LoginOptionPage
            navigationController?.pushViewController(navigate, animated: true)
        }
    }
    
//    func cell(imgs:[String]=[],head:String,prize:[String]=[],desc:String,desc1:String)
//    {
//        let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
//        navigate.imgArray = imgs
//        navigate.heading = head
//        navigate.prize = prize
//        navigate.desc = desc
//        navigate.desc1 = desc1
//        navigationController?.pushViewController(navigate, animated: true)
//    }
    
    func cell(head:String,desc:String,desc1:String)
    {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
        navigate.heading = head
        navigate.desc = desc
        navigate.desc1 = desc1
        navigationController?.pushViewController(navigate, animated: true)
    }
}

// MARK = Collection View

extension FireHomePage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView1
        {
            return 8
        }
        else
        {
            return 7
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView1
        {
            let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "Cv1CellIdentifier", for: indexPath) as! Cv1CellFile
            cell.cv1Label.text = cv1Label[indexPath.row]

            if indexPath.row == 0
            {
                cell.layer.borderColor = UIColor.black.cgColor
                cell.layer.borderWidth = 0.5
                cell.cv1Label.textColor = .black
                cell.cv1Label.text = FireHomePage.category
            }
            else
            {
                cell.layer.borderColor = UIColor.lightGray.cgColor
                cell.layer.borderWidth = 0.5
                cell.cv1Label.textColor = .lightGray
            }
            return cell
        }
        else
        {
            let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "Cv2CellIdentifier", for: indexPath) as! Cv2CellFile
            cell.cv2Img.image = UIImage( named: cv2Img[indexPath.row])
            cell.cv2Label.text = cv2label[indexPath.row]
            cell.cv2Label2.text = cv2Label2[indexPath.row]
            cell.cv2Label.setContentCompressionResistancePriority(.required, for: .horizontal)
            cell.cv2Label.setContentHuggingPriority(.required, for: .horizontal)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView1
        {
            if indexPath.row == 1
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Original"
                navigate.imgArray = cv2OriginalImg
                navigate.prize = prize
                navigate.desc = "Original Casual"
                navigate.desc1 = "adidas original"
                navigationController?.pushViewController(navigate, animated: true)
                //cell(head: "Original", desc: "Original Casual", desc1: "adidas original")
                
            }
            else if indexPath.row == 2
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Cricket"
                navigate.imgArray = cv2CricketImg
                navigate.prize = prize
                navigate.desc = "Indian Cricket ODI"
                navigate.desc1 = "Mens Performance"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 3
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Yeezy"
                navigate.imgArray = cv2YeezyImg
                navigate.prize = prize
                navigate.desc = "Adidas Yeezy"
                navigate.desc1 = "adidas"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 4
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Running"
                navigate.imgArray = cv2RunningImg
                navigate.prize = prize
                navigate.desc = "Switch FWD Running"
                navigate.desc1 = "Shoes"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 5
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Tennis"
                navigate.imgArray = cv2TennisImg
                navigate.prize = prize
                navigate.desc = "The New York Collection"
                navigate.desc1 = "Performance"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 6
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Basketball"
                navigate.imgArray = cv2BasketImg
                navigate.prize = prize
                navigate.desc = "New Collection"
                navigate.desc1 = "Shoes"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Sportswear"
                navigate.imgArray = cv2SportsImg
                navigate.prize = prize
                navigate.desc = "Z.N.E Collection"
                navigate.desc1 = "Sportswear"
                navigationController?.pushViewController(navigate, animated: true)
            }
        }
        else
        {
            if indexPath.row == 0
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Original"
                navigate.imgArray = cv2OriginalImg
                navigate.prize = prize
                navigate.desc = "Original Casual"
                navigate.desc1 = "adidas original"
                navigationController?.pushViewController(navigate, animated: true)
                
            }
            else if indexPath.row == 1
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Cricket"
                navigate.imgArray = cv2CricketImg
                navigate.prize = prize
                navigate.desc = "Indian Cricket ODI"
                navigate.desc1 = "Mens Performance"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 2
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Yeezy"
                navigate.imgArray = cv2YeezyImg
                navigate.prize = prize
                navigate.desc = "Adidas Yeezy"
                navigate.desc1 = "adidas"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 3
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Running"
                navigate.imgArray = cv2RunningImg
                navigate.prize = prize
                navigate.desc = "Switch FWD Running"
                navigate.desc1 = "Shoes"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 4
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Tennis"
                navigate.imgArray = cv2TennisImg
                navigate.prize = prize
                navigate.desc = "The New York Collection"
                navigate.desc1 = "Performance"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 5
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Basketball"
                navigate.imgArray = cv2BasketImg
                navigate.prize = prize
                navigate.desc = "New Collection"
                navigate.desc1 = "Shoes"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.imgArray = cv2SportsImg
                navigate.heading = "Sportswear"
                navigate.prize = prize
                navigate.desc = "Z.N.E Collection"
                navigate.desc1 = "Sportswear"
                navigationController?.pushViewController(navigate, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView1
        {
            return CGSize(width: 138, height: 33)
        }
        else
        {
            return CGSize(width: 393, height: 620)
        }
    }
}

