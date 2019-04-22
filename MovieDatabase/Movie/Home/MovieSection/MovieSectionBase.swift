//
//  MovieSectionBase.swift
//  Movie
//
//  Created by Richard Leh on 22/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

public protocol MovieSectionDelegateProtocol: class {
    func didSelect(movie: Movie)
}

public protocol MovieSectionProtocol {
    var flowLayout: UICollectionViewFlowLayout { get set }
    var collectionView: UICollectionView { get set }
    var viewModel: MovieSectionViewModelProtocol { get set }
    
    func updateView()
    func sectionHeight() -> CGFloat
}

public class MovieSectionBase: UIView, MovieSectionProtocol {
    public weak var delegate: MovieSectionDelegateProtocol?
    
    public var flowLayout: UICollectionViewFlowLayout
    public var collectionView: UICollectionView
    
    public func updateView() {
        self.collectionView.reloadData()
    }
    public func sectionHeight() -> CGFloat {
        return 240
    }
    
    public var viewModel: MovieSectionViewModelProtocol = MovieSectionViewModel() {
        didSet {
            updateView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        self.flowLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        
        super.init(frame: frame)
        
        self.flowLayout.scrollDirection = .horizontal
        self.flowLayout.itemSize = CGSize(width: 100, height: self.sectionHeight())
        
        self.collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

extension MovieSectionBase: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        delegate?.didSelect(movie: movie)
    }
}

extension MovieSectionBase: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieSectionBaseId", for: indexPath)
        return cell
    }
}
