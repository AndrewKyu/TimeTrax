
//
//  ProjectTableViewCell.swift
//  TimeTrax
//
//  Created by Andrew Kyu on 4/28/18.
//  Copyright © 2018 AndrewKyuProjects. All rights reserved.
//
import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var groupMembersLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
