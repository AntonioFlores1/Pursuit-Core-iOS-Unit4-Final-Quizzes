//
//  ProfileTableViewCell.swift
//  Quizzes
//
//  Created by Pursuit on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var textFIeld: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//profileImage.layer.cornerRadius = profileImage.bounds.width / 2.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    
}
