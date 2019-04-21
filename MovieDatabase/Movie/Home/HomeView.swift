//
//  HomeView.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

final class HomeView: UIView {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        return scrollView
    }()
    
    let popularMovieSection: MovieSectionView = {
        let sectionView = MovieSectionView(frame: .zero)
        return sectionView
    }()
    
    let topRatedMovieSection: MovieSectionView = {
        let sectionView = MovieSectionView(frame: .zero)
        return sectionView
    }()
    
    var popularViewModel: PopularMovieSectionViewModel = PopularMovieSectionViewModel(movies: []) {
        didSet {
            updateView()
        }
    }
    
    var topRatedViewModel: TopRatedMovieSectionViewModel = TopRatedMovieSectionViewModel(movies: []) {
        didSet {
            updateView()
        }
    }
    
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
        popularMovieSection.viewModel = self.popularViewModel
        topRatedMovieSection.viewModel = self.topRatedViewModel
    }
}

extension HomeView: CodeView {
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(popularMovieSection)
        scrollView.addSubview(topRatedMovieSection)
    }
    
    func setupConstraints() {
        
        scrollView.layout.makeConstraints { make in
            make.top.equalTo(layout.safeArea.top)
            make.left.equalTo(layout.safeArea.left)
            make.right.equalTo(layout.safeArea.right)
            make.bottom.equalTo(layout.safeArea.bottom)
        }
        
        popularMovieSection.layout.makeConstraints { make in
            make.top.equalTo(scrollView.layout.top)
            make.left.equalTo(scrollView.layout.left)
            make.width.equalTo(layout.width)
            make.height.equalTo(constant: popularMovieSection.sectionHeight)
        }
        
        topRatedMovieSection.layout.makeConstraints { make in
            make.top.equalTo(popularMovieSection.layout.bottom)
            make.left.equalTo(scrollView.layout.left)
            make.width.equalTo(layout.width)
            make.height.equalTo(constant: topRatedMovieSection.sectionHeight)
        }
    }
    func setupAdditionalConfiguration() {
        backgroundColor = .black
        
        let contentSizeHeight = popularMovieSection.sectionHeight +
                                topRatedMovieSection.sectionHeight
        scrollView.contentSize = CGSize(width: 0, height: contentSizeHeight)
    }
}
