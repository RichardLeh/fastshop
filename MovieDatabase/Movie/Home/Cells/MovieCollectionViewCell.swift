//
//  MovieCollectionViewCell.swift
//  Movie
//
//  Created by Richard Leh on 18/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, Identifiable {
    
    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        return label
    }()
    
    var posterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .magenta
        setupView()
    }
    
    func setupView(with movie: Movie) {
        titleLabel.text = movie.title
        
        let moviePlaceholder = MoviePlaceholder()
        
        posterImageView.image = nil
        posterImageView.kf.setImage(with: movie.posterURL, // TODO: refator depreceated method
                                    placeholder: moviePlaceholder,
                                    options: [.transition(.fade(0.5))],
                                    progressBlock: nil) { [weak self] (image, error, cache, url) in
                                        
                                        guard image != nil else {
                                            self?.posterImageView.image = #imageLiteral(resourceName: "icon-error-poster")
                                            moviePlaceholder.remove()
                                            
                                            return
                                        }
                                        
                                        moviePlaceholder.remove()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(posterImageView)
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        posterImageView.layout.makeConstraints { (make) in
            make.top.equalTo(self.layout.top)
            make.right.equalTo(self.layout.right)
            make.bottom.equalTo(self.layout.bottom)
            make.left.equalTo(self.layout.left)
        }
        
        titleLabel.layout.makeConstraints { make in
            make.height.equalTo(constant: 40)
            make.left.equalTo(self.layout.left)
            make.right.equalTo(self.layout.right)
            make.bottom.equalTo(self.layout.bottom)
        }
    }
}
