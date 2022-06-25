//
//  ProductModel.swift
//  ProductLists
//
//  Created by amosevasanth.s on 24/06/22.
//

import Foundation


class Products: Codable {
    let status: Bool
    let homeData: [HomeData]

    init(status: Bool, homeData: [HomeData]) {
        self.status = status
        self.homeData = homeData
    }
}

// MARK: - HomeDatum
class HomeData: Codable {
    let type: String
    let values: [Value]

    init(type: String, values: [Value]) {
        self.type = type
        self.values = values
    }
}

// MARK: - Value
class Value: Codable {
    let id: Int
    let name: String?
    let imageURL, bannerURL: String?
    let image: String?
    let actualPrice, offerPrice: String?
    let offer: Int?
    let isExpress: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case bannerURL = "banner_url"
        case image
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
    }

    init(id: Int, name: String?, imageURL: String?, bannerURL: String?, image: String?, actualPrice: String?, offerPrice: String?, offer: Int?, isExpress: Bool?) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.bannerURL = bannerURL
        self.image = image
        self.actualPrice = actualPrice
        self.offerPrice = offerPrice
        self.offer = offer
        self.isExpress = isExpress
    }
}
