//
//  QuestionTableViewCell.swift
//  Quiz App
//
//  Created by Paul Szydlowski on 30/08/2016.
//  Copyright © 2016 pawisoon. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var question_no: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
