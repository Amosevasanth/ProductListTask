//
//  ProductViewCell.swift
//  ProductLists
//
//  Created by amosevasanth.s on 25/06/22.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.setCornerRadius(radius: 5)
        }
    }
    
    
    @IBOutlet weak var offerTagImageView: UIImageView!
    @IBOutlet weak var offerTagLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var expressImage: UIImageView! {
        didSet {
            expressImage.setCornerRadius(radius: 2,color: .clear)
        }
    }
    
    @IBOutlet weak var actualPriceLabel: UILabel!
    @IBOutlet weak var offerPriceLabel: UILabel!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.setCornerRadius(radius: 4,color: .clear)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(value: Value) {
        
        DataManager().getImageData(value.image ?? "") { data in
            DispatchQueue.main.async {
                self.productImage.image = data == nil ? UIImage(named: "empty") : UIImage(data: data!)
            }
        }
        
        if let offer = value.offer {
            offerTagLabel.text = "\(offer)% OFF"
            offerTagImageView.isHidden = offer == 0 ? true : false
            offerTagLabel.isHidden = offer == 0 ? true : false
        }
        
        expressImage.isHidden = value.isExpress ?? true ? false : true
        
        if value.actualPrice == value.offerPrice {
            
        }
        
        actualPriceLabel.isHidden = value.actualPrice == value.offerPrice
        
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: value.actualPrice ?? "")
        attributeString.addAttributes([
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strikethroughColor: UIColor.darkGray
        ], range: NSMakeRange(0, attributeString.length))
        actualPriceLabel.attributedText = attributeString
        offerPriceLabel.text = value.offerPrice
        productNameLabel.text = value.name
        
        
    }
    
}
