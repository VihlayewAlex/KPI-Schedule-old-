//
//  ScheduleLessonCell.swift
//  KPI_Rozklad
//
//  Created by Alex on 11/8/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class ScheduleLessonCell: UITableViewCell {

    
    @IBOutlet weak var lineImageView: UIImageView!
    @IBOutlet weak var lectionName: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var auditoryNumber: UILabel!
    @IBOutlet weak var lectionType: UILabel!
    @IBOutlet weak var timeInterval: UILabel!
    @IBOutlet weak var noLessonLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
