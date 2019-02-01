//
//  SearchCollectionViewCell.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    lazy var quizLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello I Work"
        label.textAlignment = .center
        label.backgroundColor = .green
        label.numberOfLines = 3
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
       // button.titleLabel?.text = "Plus"
        button.setImage(UIImage.init(named: "add-icon-filled"), for: .normal)
       // button.backgroundColor = .orange
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
//        addSubview(quizLabel)
//        addSubview(plusButton)
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints(){
        addSubview(quizLabel)
        addSubview(plusButton)
        quizLabel.translatesAutoresizingMaskIntoConstraints = false
        quizLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        plusButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        plusButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
    }
}
