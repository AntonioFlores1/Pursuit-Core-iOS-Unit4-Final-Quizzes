//
//  QuizView.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizView: UIView {

    lazy var QuizCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 340)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.5094797015, green: 0.397929281, blue: 0.8565773368, alpha: 1)
        layout.scrollDirection = .vertical
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: UIScreen.main.bounds)
        addSubview(QuizCollectionView)
        QuizCollectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "quizCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
