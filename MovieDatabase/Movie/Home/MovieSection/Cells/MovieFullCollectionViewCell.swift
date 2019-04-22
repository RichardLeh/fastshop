//
//  MovieFullCollectionViewCell.swift
//  Movie
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

class MovieFullCollectionViewCell: UICollectionViewCell, Identifiable {
    
    lazy var titleLabel: UIPaddedLabel = {
        let label = UIPaddedLabel(frame: .zero)
        label.textColor = ColorName.movieFullItemTitle.color
        label.backgroundColor = UIColor.init(white: 0.3, alpha: 0.5)
        label.font = label.font.withSize(12)
        return label
    }()
    
    var backdropImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView(with movie: Movie) {
        
        titleLabel.text = movie.title
        
        let moviePlaceholder = MoviePlaceholder()
        backdropImageView.image = nil
        backdropImageView.kf.setImage(with: movie.backdropURL,
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

extension MovieFullCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addView(backdropImageView, titleLabel)
    }
    
    func setupConstraints() {
        backdropImageView.layout.makeConstraints { (make) in
            make.top.equalTo(layout.top)
            make.right.equalTo(layout.right)
            make.left.equalTo(layout.left)
            make.bottom.equalTo(layout.bottom)
        }
        
        titleLabel.layout.makeConstraints { make in
            make.top.equalTo(backdropImageView.layout.top, constant: 8)
            make.right.equalTo(backdropImageView.layout.right, constant: -16)
        }
    }
}
