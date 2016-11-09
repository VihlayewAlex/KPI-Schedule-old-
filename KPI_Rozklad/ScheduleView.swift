//
//  ScheduleView.swift
//  KPI_Rozklad
//
//  Created by Alex on 11/7/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class ScheduleView: UITableViewController {

    
    var isLoadingSchedule = false
    var weekNumber = 0
    var schedule: APISchedule!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting view's style
        let backgroundImage = UIImage(named: "BG_BLR.png")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        self.tableView.backgroundView = imageView
        
        
        // Preparing content
        isLoadingSchedule = true
        DispatchQueue.global(qos: .background).async {
            // Get schedule
            self.schedule = getAPISchedule(fromURL: getGroupScheduleURL(forGroupWithID: 497))
            
            if self.schedule == nil {
                
                let alert = UIAlertController(title: "Ebat' hujna!", message: "cheto internet ne tort, bratunya(", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Pechalka'", style: UIAlertActionStyle.cancel, handler: { (ACTION) -> Void in
                    _ = self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
            
            // Sync and update UI
            DispatchQueue.main.async {
                self.isLoadingSchedule = false
                self.tableView.reloadData()
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Table view data source

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if schedule != nil {
            switch isLoadingSchedule {
            case true:
                return 0
            default:
                return getDaysCount(fromAPISchedule: schedule, weekNumber: weekNumber)
            }
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if schedule != nil {
            switch isLoadingSchedule {
            case true:
                return 0
            default:
                return getLessonsCount(fromAPISchedule: schedule, weekNumber: weekNumber, dayNumber: section)
            }
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleLessonCell

        
        if getAPILesson(fromAPISchedule: schedule, weekNumber: weekNumber, dayNumber: indexPath.section, lessonNumber: indexPath.row).exists == true {
            let lesson = getAPILesson(fromAPISchedule: schedule, weekNumber: weekNumber, dayNumber: indexPath.section, lessonNumber: indexPath.row)
            cell.noLessonLabel.text = ""
            
            cell.lectionName.text = lesson.discipline.name
            
            if lesson.teachers.count != 0 {
                cell.teacherName.text = lesson.teachers[0].short_name
            } else {
                cell.teacherName.text = "---"
            }
            
            if lesson.rooms.count != 0 {
                cell.auditoryNumber.text = lesson.rooms[0].name
                cell.auditoryNumber.text = lesson.rooms[0].name + "-" + lesson.rooms[0].building.name
            } else {
                cell.auditoryNumber.text = "---"
            }
            
            switch lesson.type {
            case 0:
                cell.lectionType.text = "Lection"
            case 1:
                cell.lectionType.text = "Practice"
            case 2:
                cell.lectionType.text = "Laboratory"
            default:
                cell.lectionType.text = "---"
            }
            
            cell.timeInterval.text = ""
            
            
            switch indexPath.row {
            case 0:
                cell.timeInterval.text = "8:30 - 10:05"
            case 1:
                cell.timeInterval.text = "10:25 - 12:00"
            case 2:
                cell.timeInterval.text = "12:20 - 13:55"
            case 3:
                cell.timeInterval.text = "14:15 - 15:50"
            case 4:
                cell.timeInterval.text = "16:10 - 17:45"
            case 5:
                cell.timeInterval.text = "18:05 - 19:40"
            default:
                cell.timeInterval.text = "Ebat' dolgo!!!"
            }
            
            
        } else {
            cell.noLessonLabel.text = "NO LESSON"
            cell.lectionName.text = ""
            cell.teacherName.text = ""
            cell.auditoryNumber.text = ""
            cell.lectionType.text = ""
            cell.timeInterval.text = ""
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        
        if indexPath.row == 0 {
            cell.lineImageView.image = UIImage(named: "line_top")
        } else if indexPath.row == getLessonsCount(fromAPISchedule: schedule, weekNumber: weekNumber, dayNumber: indexPath.section)-1 {
            cell.lineImageView.image = UIImage(named: "line_bottom")
        } else {
            cell.lineImageView.image = UIImage(named: "line_center")
        }
        
        
        return cell
    }
    

    
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.2)
        })
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.clear
        })
    }
    
    
    
    @IBAction func weekChanged(_ sender: UISegmentedControl) {
        weekNumber = sender.selectedSegmentIndex
        tableView.reloadData()
    }
    
    
    
    
    
    
}
