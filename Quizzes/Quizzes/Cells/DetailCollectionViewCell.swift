//
//  DetailCollectionViewCell.swift
//  Quizzes
//
//  Created by Pursuit on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    lazy var TitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Whats up"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        addSubview(TitleLabel)
        SetUpConstraints()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetUpConstraints() {
        addSubview(TitleLabel)
        TitleLabel.translatesAutoresizingMaskIntoConstraints = false
        TitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        TitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        TitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        TitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
