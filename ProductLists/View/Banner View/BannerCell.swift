//
//  BannerCell.swift
//  ProductLists
//
//  Created by amosevasanth.s on 25/06/22.
//

import UIKit

class BannerCell: UITableViewCell {
    
    var cellSize = CGSize()
    var list = [Value]()

    @IBOutlet weak var bannerListView: UICollectionView! {
        didSet {
            bannerListView.delegate = self
            bannerListView.dataSource = self
            bannerListView.register(UINib(nibName: "BannerViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerViewCell")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(value: [Value],size: CGSize) {
        self.list = value
        cellSize = size
        self.bannerListView.reloadData()
    }
    
}

extension BannerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerViewCell", for: indexPath) as! BannerViewCell
        cell.configureCell(value: list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}
