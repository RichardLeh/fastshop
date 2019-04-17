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
        return flowLayout
    }()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        return collectionView
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
    }
}

extension HomeView: CodeView {
    func buildViewHierarchy() {
        addView(collectionView)
    }
    
    func setupConstraints() {
        
        collectionView.layout.makeConstraints { make in
            make.top.equalTo(self.layout.safeArea.top)
            make.right.equalTo(self.layout.safeArea.right)
            make.bottom.equalTo(self.layout.safeArea.bottom)
            make.left.equalTo(self.layout.safeArea.left)
        }
        
    }
    func setupAdditionalConfiguration() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        backgroundColor = .red
        collectionView.backgroundColor = .green
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
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
