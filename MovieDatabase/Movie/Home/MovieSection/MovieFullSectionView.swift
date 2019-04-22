//
//  MovieFullSectionView.swift
//  Movie
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

public class MovieFullSectionView: MovieSectionBase {
    
    public override func sectionHeight() -> CGFloat {
        return 140
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.flowLayout.scrollDirection = .horizontal
        self.flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: self.sectionHeight())
        self.flowLayout.minimumInteritemSpacing = 0
        self.flowLayout.minimumLineSpacing = 0
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        self.collectionView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = true
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MovieFullSectionView: CodeView {
    func buildViewHierarchy() {
        addView(collectionView)
    }
    
    func setupConstraints() {
        collectionView.layout.makeConstraints { make in
            make.top.equalTo(layout.top)
            make.left.equalTo(layout.left)
            make.right.equalTo(layout.right)
            make.bottom.equalTo(layout.bottom)
        }
    }
    func setupAdditionalConfiguration() {
        collectionView.register(MovieFullCollectionViewCell.self,
                                forCellWithReuseIdentifier: MovieFullCollectionViewCell.identifier)
    }
}

extension MovieFullSectionView {

    public override func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieFullCollectionViewCell.identifier,
                                                            for: indexPath) as? MovieFullCollectionViewCell else {
                                                                return UICollectionViewCell()
        }
        let movie = viewModel.movies[indexPath.row]
        cell.setupView(with: movie)

        return cell
    }
}
