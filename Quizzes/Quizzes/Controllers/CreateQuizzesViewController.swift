//
//  CreateQuizzesViewController.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateQuizzesViewController: UIViewController {

    private var CreatFactPlaceHolder1 = "Please Insert Fact 1"
    private var CreatFactPlaceHolder2 = "Please Insert Fact 2"
    
    @IBOutlet weak var CreateFactPlaceHolder1: UITextView!
    
    @IBOutlet weak var CreateFactPlaceHolder2: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.view.backgroundColor = .yellow
    CreateFactPlaceHolder1.delegate = self
    CreateFactPlaceHolder2.delegate = self
    CreateFactPlaceHolder1.text = CreatFactPlaceHolder1
    CreateFactPlaceHolder2.text = CreatFactPlaceHolder1
    CreateFactPlaceHolder1.textColor = .black
    CreateFactPlaceHolder2.textColor = .black
    print(DataPersistenceManager.documentsDirectory())
    }
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
      //  dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CreateItem(_ sender: UIBarButtonItem) {
    guard let itemTitle = CreateFactPlaceHolder1.text,
    let itemDescription = CreateFactPlaceHolder2.text else {
                fatalError("Title, Description nil")
        }
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        let item = Item.init(title: itemTitle, description: itemDescription, createdAt: timestamp)
        ItemModel.addItem(item: item)
        dismiss(animated: true, completion: nil)
    }
}
extension CreateQuizzesViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
    if CreateFactPlaceHolder1.text == CreatFactPlaceHolder1 {
            textView.text = ""
            textView.textColor = .black
        }
    if CreateFactPlaceHolder2.text == CreatFactPlaceHolder2 {
            textView.text = ""
            textView.textColor = .black
        }
    }
}
