//
//  ShopPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 17/08/23.
//

import UIKit

class ShopPage: UIViewController {
    
   
    var tb1Label = ["FOOTWEAR","CLOTHING","ACCESSORIES","SHOP BY SPORT","SHOP BY FRANCHISE","SALE","FLAT 50% OFF"]
    var tb2Label = ["CRICKET","WALKING","NEW ARRIVALS","STELLA MCCARTNEY","BEST OF ORIGINALS","SUPERNOVA RUNNING","SUPERSTAR"]
    var tb2cv1 = [["11","12","13","14","15"],["21","22","23","24","25"],["31","32","33","34","35"],["41","42","43","44","45"],["51","52","53","54","55"],["61","62","63","64","65"],["71","72","73","74","75"]]
    var tb2cv1Price = [["2999","1999","3999","999","699"],["899","399","599","799","1999"],["2999","1999","3999","999","699"],["899","399","599","799","1999"], ["2999","1999","3999","999","699"],["899","399","599","799","1999"], ["2999","1999","3999","999","699"]]
    var tb2Cv1Desc1 = [["INDIAN CRICKET T20I JERSEY","IINDIAN CRICKET T20I JERSEY","INDIAN CRICKET T20I JERSEY","INDIAN CRICKET T20I JERSEY","INDIAN CRICKET T20I JERSEY"],["SHEENWALK WALKING","SHEENWALK WALKING","SHEENWALK WALKING","SHEENWALK WALKING","SHEENWALK WALKING"],["SWITCH FWD RUNNING SHOES","SWITCH FWD RUNNING SHOES","SWITCH FWD RUNNING SHOES","SWITCH FWD RUNNING SHOES","SWITCH FWD RUNNING SHOES"],["STELLA MCCARTNEY SCUBA HOODIE","STELLA MCCARTNEY SCUBA HOODIE","STELLA MCCARTNEY SCUBA HOODIE","STELLA MCCARTNEY SCUBA HOODIE","STELLA MCCARTNEY SCUBA HOODIE"],["BEST OF SUPERSTAR SHOES","BEST OF SUPERSTAR SHOES","BEST OF SUPERSTAR SHOES","BEST OF SUPERSTAR SHOES","BEST OF SUPERSTAR SHOES"],["SUPERNOVA @ RUNNING SHOES","SUPERNOVA @ RUNNING SHOES","SUPERNOVA @ RUNNING SHOES","SUPERNOVA @ RUNNING SHOES","SUPERNOVA @ RUNNING SHOES"],["SUPERSTAR XLG SHOES","SUPERSTAR XLG SHOES","SUPERSTAR XLG SHOES","SUPERSTAR XLG SHOES","SUPERSTAR XLG SHOES"]]
    var tb2Cv1Desc2 = [["Performance","Performance","Performance","Performance","Performance"],["Sportswear","Sportswear","Sportswear","Sportswear","Sportswear"],["Performance","Performance","Performance","Performance","Performance"],["By Stella McCartney","By Stella McCartney","By Stella McCartney","By Stella McCartney","By Stella McCartney"],["Originals","Originals","Originals","Originals","Originals"],["Performance","Performance","Performance","Performance","Performance"],["Originals","Originals","Originals","Originals","Originals"]]
    
    var tv1Clothing = ["basket1","basket2","basket3","basket4","sport1","sport2","sport3","sport4","sport5","c1","c2","c3","c4","c5","c6","c7","c8","c9","c10"]
    var tv2CricketImg = ["c1","c2","c3","c4","c5","c6","c7","c8","c9","c10","14","15"]
    var tv2OriginalImg = ["o1","o2","o3","o4","o5","o6","o7","o10"]
    var tv2YeezyImg = ["yeezy1","yeezy2","yeezy3","yeezy4","yeezy5","yeezy6","yeezy7","yeezy8","yeezy9","yeezy10"]
    var tv2RunningImg = ["run1","run2","run3","run4","run5"]
    var tv2BasketImg = ["51","52","53","54","55","basket1","basket2","basket3","basket4","basket5"]
    var tv2TennisImg = ["61","62","63","64","65","tennis1","tennis2","tennis3","tennis4","tennis5"]
    var tv2SportsImg = ["71","72","73","74","75","sport1","sport2","sport3","sport4","sport5"]
    var prize = ["₹2999","₹1999","₹3999","₹999","₹699","₹899","₹399","₹599","₹799","₹1999"]
    
    let imageArraysForRows: [[UIImage]] = [
            [UIImage(named: "11")!, UIImage(named: "12")!, UIImage(named: "13")!,UIImage(named: "14")!,UIImage(named: "15")!],
            [UIImage(named: "21")!, UIImage(named: "22")!, UIImage(named: "23")!,UIImage(named: "24")!,UIImage(named: "25")!],
            [UIImage(named: "31")!, UIImage(named: "32")!, UIImage(named: "33")!,UIImage(named: "34")!,UIImage(named: "35")!],
            [UIImage(named: "41")!, UIImage(named: "42")!, UIImage(named: "43")!,UIImage(named: "44")!,UIImage(named: "45")!],
            [UIImage(named: "51")!, UIImage(named: "52")!, UIImage(named: "53")!,UIImage(named: "54")!,UIImage(named: "55")!],
            [UIImage(named: "61")!, UIImage(named: "62")!, UIImage(named: "63")!,UIImage(named: "64")!,UIImage(named: "65")!],
            [UIImage(named: "71")!, UIImage(named: "72")!, UIImage(named: "73")!,UIImage(named: "74")!,UIImage(named: "75")!]
        ]

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var searchBar1: UISearchBar!
    
    var searchBarSize = UISearchBar()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar1.delegate = self
        filteredData = tb1Label
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
    
    @IBAction func shopNowButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
        navigate.heading = "Cricket"
        navigate.imgArray = tv2CricketImg
        navigate.prize = prize
        navigate.desc = "Indian Cricket ODI"
        navigate.desc1 = "Mens Performance"
        navigationController?.pushViewController(navigate, animated: true)
    }
}

// MARK = Search Bar

extension ShopPage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = tb1Label.filter{ $0.lowercased().contains(searchText.lowercased()) }
        tableView1.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredData = tb1Label
        tableView1.reloadData()
        searchBar.resignFirstResponder()
    }
}

// MARK = Table View

extension ShopPage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView1
        {
            return filteredData.count
        }
        else
        {
            return tb2Label.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView1
        {
            let cell = tableView1.dequeueReusableCell(withIdentifier: "Tb1CellIdentifier", for: indexPath) as! Tb1CellFile
            //cell.tb1Label.text = tb1Label[indexPath.row]
            cell.tb1Label.text = filteredData[indexPath.row]
            return cell
        }
        else
        {
            let cell = tableView2.dequeueReusableCell(withIdentifier: "Tb2CellIdentifier", for: indexPath) as! Tb2CellFile
            cell.tb2Label.text = tb2Label[indexPath.row]
            cell.tb2Label2.layer.borderWidth = 0.5
            cell.tb2Label2.layer.borderColor = UIColor.black.cgColor
            cell.imageArray = imageArraysForRows[indexPath.row]
            cell.priceArray = tb2cv1Price[indexPath.row]
            cell.desc1Array = tb2Cv1Desc1[indexPath.row]
            cell.desc2Array = tb2Cv1Desc2[indexPath.row]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView1
        {
            if indexPath.row == 0
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.imgArray = tv2YeezyImg
                navigate.heading = "Yeezy"
                navigate.prize = prize
                navigate.desc = "Adidas Yeezy"
                navigate.desc1 = "adidas"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else  if indexPath.row == 1
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.imgArray = tv1Clothing
                navigate.heading = "Sportswear"
                navigate.prize = prize
                navigate.desc = "Z.N.E Collection"
                navigate.desc1 = "Sportswear"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 2
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Yeezy"
                navigate.imgArray = tv2YeezyImg
                navigate.prize = prize
                navigate.desc = "Adidas Yeezy"
                navigate.desc1 = "adidas"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 3
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Sportswear"
                navigate.imgArray = tv2SportsImg
                navigate.prize = prize
                navigate.desc = "Z.N.E Collection"
                navigate.desc1 = "Sportswear"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 4
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Basketball"
                navigate.imgArray = tv2BasketImg
                navigate.prize = prize
                navigate.desc = "New Collection"
                navigate.desc1 = "Shoes"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 5
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Tennis"
                navigate.imgArray = tv2TennisImg
                navigate.prize = prize
                navigate.desc = "The New York Collection"
                navigate.desc1 = "Performance"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Running"
                navigate.imgArray = tv2RunningImg
                navigate.prize = prize
                navigate.desc = "Switch FWD Running"
                navigate.desc1 = "Shoes"
                navigationController?.pushViewController(navigate, animated: true)
            }
        }
        else
        {
            if indexPath.row == 0
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.imgArray = tv2CricketImg
                navigate.heading = "Cricket"
                navigate.prize = prize
                navigate.desc = "Indian Cricket ODI"
                navigate.desc1 = "Mens Performance"
                navigationController?.pushViewController(navigate, animated: true)
                
            }
            else if indexPath.row == 1
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Original"
                navigate.imgArray = tv2OriginalImg
                navigate.prize = prize
                navigate.desc = "Original Casual"
                navigate.desc1 = "adidas original"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 2
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Yeezy"
                navigate.imgArray = tv2YeezyImg
                navigate.prize = prize
                navigate.desc = "Adidas Yeezy"
                navigate.desc1 = "adidas"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 3
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Running"
                navigate.imgArray = tv2RunningImg
                navigate.prize = prize
                navigate.desc = "Switch FWD Running"
                navigate.desc1 = "Shoes"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 4
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Basketball"
                navigate.imgArray = tv2BasketImg
                navigate.prize = prize
                navigate.desc = "New Collection"
                navigate.desc1 = "Shoes"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else if indexPath.row == 5
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Tennis"
                navigate.imgArray = tv2TennisImg
                navigate.prize = prize
                navigate.desc = "The New York Collection"
                navigate.desc1 = "Performance"
                navigationController?.pushViewController(navigate, animated: true)
            }
            else
            {
                let navigate = storyboard?.instantiateViewController(withIdentifier: "Cv2NavigationPage") as! Cv2NavigationPage
                navigate.heading = "Sportswear"
                navigate.imgArray = tv2SportsImg
                navigate.prize = prize
                navigate.desc = "Z.N.E Collection"
                navigate.desc1 = "Sportswear"
                navigationController?.pushViewController(navigate, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableView1
        {
            return 60
        }
        else
        {
            return 388
        }
        
    }
    
}
