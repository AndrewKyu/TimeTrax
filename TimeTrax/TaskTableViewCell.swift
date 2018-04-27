//
//  TaskTableViewCell.swift
//  TimeTrax
//
//  Created by John Tumath on 4/26/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var prioritySymbol: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var taskName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
