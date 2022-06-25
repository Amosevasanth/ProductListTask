//
//  ProductViewModel.swift
//  ProductLists
//
//  Created by amosevasanth.s on 25/06/22.
//

import UIKit

enum ListType: String {
    case category
    case banners
    case products
}

class ProductViewModel: NSObject {
    
    let productDM = DataManager()
    
    var homeData = [HomeData]()
    
    var categoriesList = [Value]()
    var bannersList = [Value]()
    var productsList = [Value]()
    
    override init() {
        super.init()
        
    }
    
    func loadData(success:@escaping() -> (Void)) {
        productDM.fetchData { [self] values in
            homeData = values.homeData
            for list in values.homeData {
                switch list.type {
                case ListType.category.rawValue:
                    categoriesList = list.values
                case ListType.banners.rawValue:
                    bannersList = list.values
                case ListType.products.rawValue:
                    productsList = list.values
                default:
                    break
                }
            }
            success()
        } onFailure: { error in
            print(error)
        }
        
    }
    
}
