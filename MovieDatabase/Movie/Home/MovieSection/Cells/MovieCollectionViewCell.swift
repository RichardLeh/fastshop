//
//  MovieCollectionViewCell.swift
//  Movie
//
//  Created by Richard Leh on 18/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, Identifiable {
    
    var posterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = ColorName.movieItemTitle.color
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        return label
    }()
    
    var genreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = ColorName.movieItemSubtitle.color
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView(with movie: Movie) {
        titleLabel.text = movie.title
        titleLabel.sizeToFit()
        titleLabel.setNeedsDisplay()
        
        genreLabel.text = movie.genreFirst
        
        let moviePlaceholder = MoviePlaceholder()
        posterImageView.image = nil
        posterImageView.kf.setImage(with: movie.posterURL,
                                    placeholder: moviePlaceholder,
                                    options: [.cacheOriginalImage, .transition(.fade(0.5))]) { result in
                                        switch result {
                                        case .success(let value):
                                            moviePlaceholder.remove()
                                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                                            print("Cache Type: \(value.cacheType)")
                                        case .failure(let error):
                                            print("Job failed: \(error.localizedDescription)")
                                        }
                                    }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addView(posterImageView, titleLabel, genreLabel)
    }
    
    func setupConstraints() {
        posterImageView.layout.makeConstraints { (make) in
            make.top.equalTo(layout.top)
            make.right.equalTo(layout.right)
            make.left.equalTo(layout.left)
            make.height.equalTo(constant: 170)
        }
        
        titleLabel.layout.makeConstraints { make in
            make.top.equalTo(posterImageView.layout.bottom, constant: 8)
            make.height.lessThanOrEqualTo(constant: 30)
            make.left.equalTo(layout.left)
            make.right.equalTo(layout.right)
            make.bottom.equalTo(genreLabel.layout.top, constant: -4)
        }
        
        genreLabel.layout.makeConstraints { make in
            make.left.equalTo(layout.left)
            make.right.equalTo(layout.right)
        }
    }
}
