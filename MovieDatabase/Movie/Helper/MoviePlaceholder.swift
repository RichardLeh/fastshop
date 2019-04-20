//
//  MoviePlaceholder.swift
//  Movie
//
//  Created by Richard Leh on 20/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

struct MoviePlaceholder: Placeholder {
    
    let indicatorView = UIActivityIndicatorView(style: .whiteLarge)
    
    func add(to imageView: ImageView) {
        imageView.addSubview(indicatorView)
        indicatorView.startAnimating()
        indicatorView.layout.makeConstraints { make in
            make.centerX.equalTo(imageView.layout.centerX)
            make.centerY.equalTo(imageView.layout.centerY)
        }
    }
    
    func remove(from imageView: ImageView) {
        self.remove()
    }
    
    func remove() {
        indicatorView.stopAnimating()
        indicatorView.removeFromSuperview()
    }
    
}
