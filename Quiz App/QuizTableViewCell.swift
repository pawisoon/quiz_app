//
//  QuizTableViewCell.swift
//  Quiz App
//
//  Created by Paul Szydlowski on 28/08/2016.
//  Copyright © 2016 pawisoon. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    //MARK: Properties 
    
    @IBOutlet weak var quiz_pic: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
