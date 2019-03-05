//
//  HomeView.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

final class HomeView: UIView {
    
    var viewModel: HomeViewModel? {
        didSet {
            updateView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func updateView() {
        
    }
}

extension HomeView: CodeView {
    func buildViewHierarchy() { }
    func setupConstraints() { }
    func setupAdditionalConfiguration() {
        self.backgroundColor = .red
    }
}
