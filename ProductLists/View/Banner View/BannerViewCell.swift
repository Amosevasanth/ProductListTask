//
//  BannerViewCell.swift
//  ProductLists
//
//  Created by amosevasanth.s on 25/06/22.
//

import UIKit

class BannerViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var bannerImageView: UIImageView! {
        didSet {
            bannerImageView.setCornerRadius(radius: 5, color: .clear)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(value: Value) {
        DataManager().getImageData(value.bannerURL ?? "") { data in
            DispatchQueue.main.async {
                self.bannerImageView.image = data == nil ? UIImage(named: "empty") : UIImage(data: data!)
            }
        }
    }

}
