//
//  MovieSection.swift
//  Movie
//
//  Created by Richard Leh on 20/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Foundation
import UIKit

let collectionViewHeight: CGFloat = 240.0

final class MovieSectionView: UIView {
    
    let sectionHeight = collectionViewHeight + 20 + 16
    
    let flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 110, height: collectionViewHeight - 20)
        return flowLayout
    }()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
        return collectionView
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    var viewModel: MovieSectionViewModelProtocol = MovieSectionViewModel() {
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
        titleLabel.text = viewModel.title
    }
}

extension MovieSectionView: CodeView {
    func buildViewHierarchy() {
        addView(titleLabel, collectionView)
    }
    
    func setupConstraints() {
        
        titleLabel.layout.makeConstraints { make in
            make.top.equalTo(self.layout.safeArea.top, constant: 8)
            make.left.equalTo(self.layout.safeArea.left, constant: 16)
            make.right.equalTo(self.layout.safeArea.right, constant: -16)
            make.height.equalTo(constant: 20)
        }
        
        collectionView.layout.makeConstraints { make in
            make.top.equalTo(titleLabel.layout.safeArea.bottom, constant: 8)
            make.left.equalTo(self.layout.safeArea.left)
            make.right.equalTo(self.layout.safeArea.right)
            make.height.equalTo(constant: collectionViewHeight)
        }
    }
    func setupAdditionalConfiguration() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        backgroundColor = .black
    }
}

extension MovieSectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath, viewModel.movies[indexPath.row].title)
    }
}

extension MovieSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier,
                                                            for: indexPath) as? MovieCollectionViewCell else {
                                                                return UICollectionViewCell()
        }
        let movie = viewModel.movies[indexPath.row]
        cell.setupView(with: movie)
        
        return cell
    }
}
