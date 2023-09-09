//
//  AccountSetTextFieldFile.swift
//  adidas
//
//  Created by Choudhary Dipika on 14/08/23.
//

import Foundation
import UIKit

class textFieldSetup:UITextField {
    
    required init?(coder coder: NSCoder) {
        super.init(coder: coder)
        setTextField()
    }
    
    func setTextField()
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
               self.borderStyle = .roundedRect
               self.layer.borderColor = UIColor.lightGray.cgColor
               self.layer.borderWidth = 1.0
               self.leftView = paddingView
               self.leftViewMode = .always
    }
}

