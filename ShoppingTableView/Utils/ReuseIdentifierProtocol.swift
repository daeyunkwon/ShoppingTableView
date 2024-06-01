//
//  ReuseIdentifierProtocol.swift
//  ShoppingTableView
//
//  Created by 권대윤 on 5/31/24.
//

import UIKit

protocol ReuseIdentifierProtocol {
    static var reuseIdentifier: String {get}
}

extension UITableViewCell: ReuseIdentifierProtocol {
    static var reuseIdentifier: String {
        return "MyCell"
    }
}
