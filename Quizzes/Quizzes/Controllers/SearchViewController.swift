//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var quizzes = [FactModels](){
        didSet {
            DispatchQueue.main.async {
                self.searchView.SearchCollectionView.reloadData()
            }
        }
    }
    
    
    let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = .green 
      self.view.addSubview(searchView)
      searchView.SearchCollectionView.dataSource = self
      searchView.SearchCollectionView.delegate = self
        quizInfo()
    }
    
    func quizInfo(){
        QuizFactsAPI.facts { (appError, quizdata) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let quizdata = quizdata {
                self.quizzes = quizdata
                dump(self.quizzes)
            }
        }
    }
    

}

extension SearchViewController: UICollectionViewDelegate {
    
}
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
guard let cell = searchView.SearchCollectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        
          let cellInfo = quizzes[indexPath.row]
        
        cell.quizLabel.text = cellInfo.quizTitle
        
        
        return cell
    }
    
    
}