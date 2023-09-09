//
//  ViewController.swift
//  adidas
//
//  Created by Choudhary Dipika on 05/08/23.
//

import UIKit

class CategoryPage: UIViewController {

    @IBOutlet weak var menswearButton: UIButton!
    @IBOutlet weak var womenswearButton: UIButton!
    @IBOutlet weak var kidswearButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
    }

    func setProperties() {
        menswearButton.layer.borderColor = UIColor.lightGray.cgColor
        menswearButton.layer.borderWidth = 1
        womenswearButton.layer.borderColor = UIColor.lightGray.cgColor
        womenswearButton.layer.borderWidth = 1
        kidswearButton.layer.borderColor = UIColor.lightGray.cgColor
        kidswearButton.layer.borderWidth = 1
    }
    
    
    @IBAction func menswearButtonAction(_ sender: UIButton) {
        navigation(categoryLabel: "Men's")
    }
    
    @IBAction func womenswearButton(_ sender: UIButton) {
        navigation(categoryLabel: "Women's")
    }
    
    @IBAction func kidswearButton(_ sender: UIButton) {
        navigation(categoryLabel: "Kid's")
    }
    
    func navigation(categoryLabel:String) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "TabBarMainPage") as! TabBarMainPage
        navigate.category = categoryLabel
        
        navigationController?.pushViewController(navigate, animated: true)
    }
}

