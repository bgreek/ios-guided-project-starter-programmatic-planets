//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var nameLabel = UILabel()
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubViews()
    }
    
    private func updateViews() {
        guard let planet = planet else { return }
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
    private func setupSubViews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        // This is the Y position
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        // This is the X position
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        // This is the Width
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        
        // This is the Height
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        addSubview(nameLabel)
        
        // This is the Y
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        
        // This is the X
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        
        // This is the Width
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
    }
}
