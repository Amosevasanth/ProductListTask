//
//  CategoriesCell.swift
//  ProductLists
//
//  Created by amosevasanth.s on 25/06/22.
//

import UIKit

class CategoriesCell: UITableViewCell {
    
    @IBOutlet weak var categoriesListView: UICollectionView! {
        didSet {
            categoriesListView.delegate = self
            categoriesListView.dataSource = self
            categoriesListView.register(UINib(nibName: "CategoriesViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesViewCell")
        }
    }
    
    var list = [Value]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(value: [Value]) {
        self.list = value
        self.categoriesListView.reloadData()
    }
    
}

extension CategoriesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesViewCell", for: indexPath) as! CategoriesViewCell
        cell.configureCell(value: list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 110)
    }
}
