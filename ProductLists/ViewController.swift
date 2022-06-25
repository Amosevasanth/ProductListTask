//
//  ViewController.swift
//  ProductLists
//
//  Created by amosevasanth.s on 24/06/22.
//

import UIKit

enum HeightConstants : CGFloat {
    case CategoryCell = 120
    case BannerCell = 160
    case ProductCell = 310
}

enum WidthConstants : CGFloat {
    case ProductCell = 220
}

class ViewController: UIViewController {

    @IBOutlet weak var mainListView: UITableView! {
        didSet {
            mainListView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
            mainListView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "BannerCell")
            mainListView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        }
    }
    
    var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activityIndicator = ActivityIndicator(view:view, navigationController:nil,tabBarController: nil)
        activityIndicator.showActivityIndicator()
        
        viewModel.loadData {
            DispatchQueue.main.async {
                self.mainListView.reloadData()
                activityIndicator.stopActivityIndicator()
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.homeData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = viewModel.homeData[indexPath.section].type
        switch type {
        case ListType.category.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as! CategoriesCell
            cell.configureCell(value: viewModel.categoriesList)
            return cell
        case ListType.banners.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell") as! BannerCell
            cell.configureCell(value: viewModel.bannersList, size: CGSize(width: tableView.frame.width - 50, height: HeightConstants.BannerCell.rawValue))
            return cell
        case ListType.products.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
            cell.configureCell(value: viewModel.productsList, size: CGSize(width: WidthConstants.ProductCell.rawValue, height: HeightConstants.ProductCell.rawValue))
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = viewModel.homeData[indexPath.section].type
        switch type {
        case ListType.category.rawValue:
            return HeightConstants.CategoryCell.rawValue
        case ListType.banners.rawValue:
            return HeightConstants.BannerCell.rawValue
        case ListType.products.rawValue:
            return HeightConstants.ProductCell.rawValue
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 10))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let type = viewModel.homeData[section].type
        if type == ListType.products.rawValue && section != 0 {
            return 10
        }
        return 0
    }
    
}

