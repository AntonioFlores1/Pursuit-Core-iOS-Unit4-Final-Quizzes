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
        label.numberOfLines = 3
        return label
    }()
    
    lazy var label1: UILabel = {
        let label = UILabel()
        label.text = "Hello I Work"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    lazy var label2: UILabel = {
        let label = UILabel()
        label.text = "Hello I Work"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true
        button.setImage(UIImage.init(named: "add-icon-filled"), for: .normal)
        button.addTarget(self, action: #selector(buttonStuff), for: .touchUpInside )
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    func createAlert (title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
        }))
        
       //present(alert, animated: true, completion: nil)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpConstraints()
        createAlert(title: "something happened", message: "hi")
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func buttonStuff() {
//let quizViewController = QuizzesViewController()
guard let itemTitle = quizLabel.text,
          let factUno = label1.text,
           let factDos = label2.text
        else {
            fatalError("title, description nil")
        }
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        
    let item = Item.init(title: itemTitle, description: factUno, otherDescription:factDos, createdAt: timestamp)
    ItemModel.addItem(item: item)
        
//UIStoryboardSegue.init(identifier: "comeHere", source: QuizzesViewController(), destination: QuizzesViewController())

        
    }
    
    
    func setUpConstraints(){
        addSubview(quizLabel)
        addSubview(plusButton)
        addSubview(label1)
        addSubview(label2)
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
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        label1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        label1.topAnchor.constraint(equalTo: quizLabel.bottomAnchor, constant: 0).isActive = true
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 0).isActive = true
    }
}
