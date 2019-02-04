//
//  QuizCollectionViewCell.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    lazy var Quizlabel: UILabel = {
        let label = UILabel()
        label.text = "I Work Too"
        label.textAlignment = .center
        label.font = label.font.withSize(26)
        return label
    }()
    
    lazy var ThreeDot: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "more-filled"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        addSubview(Quizlabel)
        addSubview(ThreeDot)
    ThreeDot.translatesAutoresizingMaskIntoConstraints = false
    ThreeDot.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    ThreeDot.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    ThreeDot.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    ThreeDot.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        
    Quizlabel.translatesAutoresizingMaskIntoConstraints = false
    Quizlabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    Quizlabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    Quizlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    Quizlabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
}
