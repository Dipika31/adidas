//
//  ProductPage.swift
//  adidas
//
//  Created by Choudhary Dipika on 30/08/23.
//

import UIKit

class ProductPage: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc1: UILabel!
    @IBOutlet weak var desc2: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    var imgVar = UIImage()
    var priceVar = String()
    var desc1Var = String()
    var desc2Var = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = imgVar
        price.text = priceVar
        desc1.text = desc1Var
        desc2.text = desc2Var
        totalPrice.text = priceVar
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        quantity.text = Int(quantityStepper.value).description
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buyButton(_ sender: UIButton) {
        if let viewControllers = self.navigationController?.viewControllers {
            if 2 < viewControllers.count {
                let targetViewController = viewControllers[0]
                self.navigationController?.popToViewController(targetViewController, animated: true)
            }
        }
    }
}
