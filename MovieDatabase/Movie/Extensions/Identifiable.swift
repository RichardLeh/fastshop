//
//  Identifiable.swift
//  Movie
//
//  Created by Richard Leh on 17/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

protocol Identifiable: AnyObject {}

extension Identifiable where Self: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
