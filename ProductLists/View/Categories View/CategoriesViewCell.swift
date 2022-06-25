//
//  CategoriesViewCell.swift
//  ProductLists
//
//  Created by amosevasanth.s on 24/06/22.
//

import UIKit

class CategoriesViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.setCornerRadius(radius: 40, color: .clear)
            imageView.backgroundColor = UIColor.random
        }
    }
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(value: Value) {
        
        DataManager().getImageData(value.imageURL ?? "") { data in
            DispatchQueue.main.async {
                self.imageView.image = data == nil ? UIImage(named: "empty") : UIImage(data: data!)
            }
        }
        
        categoryLabel.text = value.name
    }

}
