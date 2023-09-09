//
//  Tb2CellFile.swift
//  adidas
//
//  Created by Choudhary Dipika on 18/08/23.
//

import UIKit

class Tb2CellFile: UITableViewCell {
    
    var imageArray: [UIImage] = [] {
            didSet {
                cv.reloadData()
            }
        }
    var priceArray: [String] = [] {
            didSet {
                cv.reloadData()
            }
        }
    var desc1Array: [String] = [] {
            didSet {
                cv.reloadData()
            }
        }
    var desc2Array: [String] = [] {
            didSet {
                cv.reloadData()
            }
        }
    
    @IBOutlet weak var tb2Label: UILabel!
    @IBOutlet weak var tb2Label2: UILabel!
    @IBOutlet weak var cv: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cv.delegate = self
        cv.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

// MARK = Collection View

extension Tb2CellFile: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "Tb2CvCellIdentifier", for: indexPath) as! Tb2CvCellFile
        //cell.img.image = UIImage(named: tb2cv1[indexPath.row])
        cell.img.image = imageArray[indexPath.item]
        cell.price.text = priceArray[indexPath.row]
        cell.desc1.text = desc1Array[indexPath.row]
        cell.desc2.text = desc2Array[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 181, height: 262)
    }
}
