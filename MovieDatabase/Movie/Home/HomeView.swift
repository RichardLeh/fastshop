//
//  HomeView.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, Identifiable { }

final class HomeView: UIView {
    
    let flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 90, height: 160)
        return flowLayout
    }()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        return collectionView
    }()
    lazy var titleLabel: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    var viewModel: HomeViewModel = HomeViewModel() {
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
        collectionView.reloadData()
        titleLabel.text = "Popular Movies"
    }
}

extension HomeView: CodeView {
    func buildViewHierarchy() {
        addView(titleLabel, collectionView)
    }
    
    func setupConstraints() {
        
        titleLabel.layout.makeConstraints { make in
            make.top.equalTo(self.layout.safeArea.top, constant: 20)
            make.left.equalTo(self.layout.safeArea.left, constant: 16)
            make.right.equalTo(self.layout.safeArea.right, constant: -16)
            make.height.equalTo(constant: 20)
        }
        
        collectionView.layout.makeConstraints { make in
            make.top.equalTo(titleLabel.layout.safeArea.bottom, constant: 8)
            make.left.equalTo(self.layout.safeArea.left)
            make.right.equalTo(self.layout.safeArea.right)
            make.height.equalTo(constant: 200)
        }
        
    }
    func setupAdditionalConfiguration() {
        collectionView.dataSource = self
        collectionView.register(MovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        backgroundColor = .red
        collectionView.backgroundColor = .green
    }
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier,
                                                            for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .magenta
        return cell
    }
}
