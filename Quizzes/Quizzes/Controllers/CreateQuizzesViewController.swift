//
//  CreateQuizzesViewController.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateQuizzesViewController: UIViewController {
    
    private var funFactHolderUno = "Fun fact 1"
    private var funFactHolerDos = "Fun fact 2"

    @IBOutlet weak var category: UITextField!
    
    @IBOutlet weak var funFactUno: UITextView!
    
    @IBOutlet weak var funFactDos: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.view.backgroundColor = .yellow
    //category.becomeFirstResponder()
        TextViewSetUp()
    }
    
   func TextViewSetUp(){
    category.delegate = self
    funFactUno.delegate = self
    funFactDos.delegate = self
    funFactUno.text = funFactHolderUno
    funFactDos.text = funFactHolerDos
    funFactUno.textColor = .black
    funFactDos.textColor = .black
    }

    func createAlert (title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
        }))
        
//        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action) in
//            alert.dismiss(animated: true, completion: nil)
//            print("Confirm")
//        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func secondAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func cencelPressed(_ sender: UIBarButtonItem) {
//navigationController?.pushViewController(QuizzesViewController(), animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createPressed(_ sender: UIBarButtonItem) {
        guard let itemTitle = category.text,
            let otherItemDescription = funFactUno.text,
            let itemDescription = funFactDos.text else {
                fatalError("title, description nil")
        }
        
        // timestamp base on the current time
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        
        if category?.text == "" || funFactUno?.text == "" || funFactDos?.text == "" || funFactUno.text == funFactHolderUno || funFactDos.text == funFactHolerDos {
            createAlert(title: "Flash Card Notification", message: "Have To Fill Out All Requirments")
        } else {
        // create an item
        let item = Item.init(title: itemTitle, description: otherItemDescription, otherDescription: itemDescription, createdAt: timestamp)
        
        // save item to documents directory
        ItemModel.addItem(item: item)
navigationController?.pushViewController(QuizzesViewController(), animated: true)
    secondAlert(title: "Heya", message: "Your flash card has been succesfully added to your quizzes")

        dismiss(animated: true, completion: nil)
        }
    }
        
    }
extension CreateQuizzesViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if funFactUno.text == funFactHolderUno {
          textView.text = ""
          textView.textColor = .black
          //funFactUno.resignFirstResponder()
        }
        if funFactDos.text == funFactHolerDos {
          textView.text = ""
          textView.textColor = .black
            //funFactDos.resignFirstResponder()
        }
}
}

extension CreateQuizzesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        category.resignFirstResponder()
        return true
    }
}
