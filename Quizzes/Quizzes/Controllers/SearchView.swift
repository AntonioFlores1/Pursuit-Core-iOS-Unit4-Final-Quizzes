//
//  SearchView.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    
    
    lazy var SearchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 340)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
        layout.scrollDirection = .vertical
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
      backgroundColor = .green
        addSubview(SearchCollectionView)
SearchCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "searchCell")
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
    addSubview(SearchCollectionView)
    SearchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        SearchCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        SearchCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        SearchCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        SearchCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
    
    
    
    
    
    
    
}
