//
//  ViewController.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController {

   let quizView = QuizView()
    
  override func viewDidLoad() {
    super.viewDidLoad()
  self.view.addSubview(quizView)
  quizView.QuizCollectionView.dataSource = self
  quizView.QuizCollectionView.delegate = self
    print(DataPersistenceManager.documentsDirectory())
  }

    override func viewWillAppear(_ animated: Bool) {
     quizView.QuizCollectionView.reloadData()
    }
    
}

extension QuizzesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(MyQuizzesDetailViewController(), animated: true)
    }
}

extension QuizzesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemModel.getItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       guard let cell = quizView.QuizCollectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as? QuizCollectionViewCell else {return UICollectionViewCell()}
        let item = ItemModel.getItems()[indexPath.row]
        cell.Quizlabel.text = item.title
        
        return cell
    }
    
    
}
