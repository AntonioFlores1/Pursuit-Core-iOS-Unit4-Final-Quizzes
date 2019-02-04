//
//  MyQuizzesDetailViewController.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class MyQuizzesDetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(detailView)
        detailView.DetailColletionView.dataSource = self
        detailView.DetailColletionView.delegate = self
    }
    
    
}
extension MyQuizzesDetailViewController: UICollectionViewDelegate {
    
}

extension MyQuizzesDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

guard let cell = detailView.DetailColletionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailCollectionViewCell else {return UICollectionViewCell() }
        
        
        
        
        return cell
    }
    
    
}
