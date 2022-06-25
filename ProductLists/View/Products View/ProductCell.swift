//
//  ProductCell.swift
//  ProductLists
//
//  Created by amosevasanth.s on 25/06/22.
//

import UIKit

class ProductCell: UITableViewCell {

    var cellSize = CGSize()
    var list = [Value]()

    @IBOutlet weak var productListView: UICollectionView! {
        didSet {
            productListView.delegate = self
            productListView.dataSource = self
            productListView.register(UINib(nibName: "ProductViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductViewCell")
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
    
    func configureCell(value: [Value], size: CGSize) {
        self.list = value
        cellSize = size
        self.productListView.reloadData()
    }
    
}

extension ProductCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
        cell.configureCell(value: list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }

}
