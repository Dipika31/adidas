//
//  RadarPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 20/08/23.
//

import UIKit

class RadarPage: UIViewController {

    var cvImage = ["1","2","3","5","6"]
    var cv2OriginalImg = ["o1","o2","o3","o4","o5","o6","o7","o8","o9","o10"]
    var cv2CricketImg = ["c1","c2","c3","c4","c5","c6","c7","c8","c9","c10"]
    var cv2SportsImg = ["sport1","sport2","sport3","sport4","sport5"]
    var prize = ["2999","1999","3999","999","699","899","399","599","799","1999"]
    
    @IBOutlet weak var cv: UICollectionView!
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
    
    @IBAction func cricketButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
        navigate.heading = "Cricket"
        navigate.imgArray = cv2CricketImg
        navigate.prize = prize
        navigate.desc = "Indian Cricket ODI"
        navigate.desc1 = "Mens Performance"
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func sportsButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
        navigate.heading = "Sportswear"
        navigate.imgArray = cv2SportsImg
        navigate.prize = prize
        navigate.desc = "Z.N.E Collection"
        navigate.desc1 = "Sportswear"
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func shoesButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
        navigate.heading = "Adidas Store"
        navigate.imgArray = cv2OriginalImg
        navigate.prize = prize
        navigate.desc = "Original Casual"
        navigate.desc1 = "adidas original"
        navigationController?.pushViewController(navigate, animated: true)
    }
}

// MARK = Collection View

extension RadarPage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cvImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "CvCellIdentifier", for: indexPath) as! CvCellFile
        cell.img.image = UIImage(named: cvImage[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 322, height: 277)
    }
}
