//
//  HomeView.swift
//  Movie
//
//  Created by Richard Leh on 05/03/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

final class HomeView: UIView {
    
    weak var delegate: MovieSectionDelegateProtocol?
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        return scrollView
    }()
    let upcomingMovieSection: MovieFullSectionView = {
        let sectionView = MovieFullSectionView(frame: .zero)
        return sectionView
    }()
    let popularMovieSection: MovieSectionView = {
        let sectionView = MovieSectionView(frame: .zero)
        return sectionView
    }()
    let topRatedMovieSection: MovieSectionView = {
        let sectionView = MovieSectionView(frame: .zero)
        return sectionView
    }()
    
    var upcomingViewModel: UpcomingMovieSectionViewModel = UpcomingMovieSectionViewModel(movies: []) {
        didSet {
            updateView()
        }
    }
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        upcomingMovieSection.delegate = self
        popularMovieSection.delegate = self
        topRatedMovieSection.delegate = self
        setupView()
    }
    
    private func updateView() {
        upcomingMovieSection.viewModel = self.upcomingViewModel
        popularMovieSection.viewModel = self.popularViewModel
        topRatedMovieSection.viewModel = self.topRatedViewModel
    }
}

extension HomeView: CodeView {
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(upcomingMovieSection)
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

        upcomingMovieSection.layout.makeConstraints { make in
            make.top.equalTo(scrollView.layout.top)
            make.left.equalTo(scrollView.layout.left)
            make.width.equalTo(layout.width)
            make.height.equalTo(constant: upcomingMovieSection.sectionHeight())
        }
        
        popularMovieSection.layout.makeConstraints { make in
            make.top.equalTo(upcomingMovieSection.layout.bottom, constant: 8)
            make.left.equalTo(scrollView.layout.left)
            make.width.equalTo(layout.width)
            make.height.equalTo(constant: popularMovieSection.sectionHeight())
        }
        
        topRatedMovieSection.layout.makeConstraints { make in
            make.top.equalTo(popularMovieSection.layout.bottom)
            make.left.equalTo(scrollView.layout.left)
            make.width.equalTo(layout.width)
            make.height.equalTo(constant: topRatedMovieSection.sectionHeight())
        }
    }
    func setupAdditionalConfiguration() {
        backgroundColor = ColorName.backgroundDefault.color
        
        let contentSizeHeight = upcomingMovieSection.sectionHeight() +
                                popularMovieSection.sectionHeight() +
                                topRatedMovieSection.sectionHeight() + 8
        scrollView.contentSize = CGSize(width: 0, height: contentSizeHeight)
    }
}

extension HomeView: MovieSectionDelegateProtocol {
    public func didSelect(movie: Movie) {
        self.delegate?.didSelect(movie: movie)
    }
}
