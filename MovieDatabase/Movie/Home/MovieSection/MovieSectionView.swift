//
//  MovieSection.swift
//  Movie
//
//  Created by Richard Leh on 20/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

public class MovieSectionView: MovieSectionBase {
    
    public override func sectionHeight() -> CGFloat {
        return 276
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = ColorName.sectionTitle.color
        label.font = label.font.withSize(14)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.flowLayout = UICollectionViewFlowLayout()
        self.flowLayout.scrollDirection = .horizontal
        self.flowLayout.itemSize = CGSize(width: 110, height: self.sectionHeight() - 20)
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        self.collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.setupView()
    }
    
    public override func updateView() {
        super.updateView()
        self.titleLabel.text = viewModel.title
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
            make.height.equalTo(constant: self.sectionHeight())
        }
    }
    func setupAdditionalConfiguration() {
        collectionView.register(MovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
}

extension MovieSectionView {
    public override func collectionView(_ collectionView: UICollectionView,
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
