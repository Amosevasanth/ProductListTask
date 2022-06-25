//
//  Extension.swift
//  ProductLists
//
//  Created by amosevasanth.s on 24/06/22.
//

import UIKit

extension UIView {
    func setCornerRadius(radius: CGFloat = 10,width: CGFloat = 0.5,color: UIColor = .lightGray) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 0.2
        )
    }
}
