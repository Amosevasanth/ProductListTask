//
//  DataManager.swift
//  ProductLists
//
//  Created by amosevasanth.s on 24/06/22.
//

import UIKit
import Foundation

class DataManager: NSObject {
    
    func fetchData(onSuccess:@escaping (Products) -> (Void), onFailure:@escaping (String) -> (Void)) {
        
        let url = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")
        let request : URLRequest = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: request) {
            data,response,error in
            do {
                if let jsonData = data {
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(Products.self, from: jsonData)
                    onSuccess(list)
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
                onFailure(error.localizedDescription)
            }
            
        }
        dataTask.resume()
    }
    
    
    func getImageData(_ urlString: String, imageData:@escaping (Data?) -> (Void)) {
        if URL(string: urlString) != nil {
            URLSession.shared.dataTask(with: URL(string: urlString)! as URL, completionHandler: { (data, response, error) in
                imageData(data)
            }).resume()
        }
    }
}
