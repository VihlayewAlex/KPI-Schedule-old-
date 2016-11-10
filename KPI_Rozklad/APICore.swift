//
//  main.swift
//  KPIRozkladJSON
//
//  Created by Alex on 10/8/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation


// GENERATING GROUP SCHEDULE URL
// MUST RECEIVE PROPER GROUP ID!!!
func getGroupScheduleURL(forGroupWithID id: Int) -> URL {
    let urlString = "http://api.rozklad.hub.kpi.ua/groups/\(id)/timetable.json"
    let resultURL = URL(string: urlString)!
    return resultURL
}



// RECEIVES URL, RETURNS SCHEDULE OBJECT
// MUST RECEIVE PROPER URL!!!
// RETURNS nil IF IT IS AN ERROR
func getAPISchedule(fromURL url: URL) -> APISchedule? {
    
    print("\nDEBUG: 'getAPISchedule' method started running.\n")
    
    let schedule = APISchedule()
    
        if let data = try? Data(contentsOf: url) {
            print("\nDEBUG: Data is loaded.\n")
            
            let json = JSON(data: data)
            print("\nDEBUG: Data is in JSON now. Serializing started.\n")
            
            // Parsing schedule
            if let jsonData = json["data"].dictionary {
                
                // if week1 exists
                if let jsonWeek1 = jsonData["1"]?.dictionary {
                    // create week1 array
                    let newWeek1 = APIWeek()
                    newWeek1.number = 1
                    // loop througth days
                    for jsonDayIndex in 1...7 {
                        // checking if day exists
                        if jsonWeek1["\(jsonDayIndex)"] != nil {
                            // Day exists
                            // DEBUG: print("day \(jsonDayIndex) exists")
                            let newDay = APIDay()
                            newDay.number = jsonDayIndex
                            // loop througth lessons
                            for jsonLessonIndex in 1...7 {
                                // if lesson exists
                                if jsonWeek1["\(jsonDayIndex)"]!["\(jsonLessonIndex)"] != nil {
                                    // Lesson exists
                                    // DEBUG: print("   lesson \(jsonLessonIndex) exists")
                                    let lesson = jsonWeek1["\(jsonDayIndex)"]!["\(jsonLessonIndex)"]
                                    let newLesson = APILesson()
                                        newLesson.id = lesson["id"].intValue
                                        newLesson.type = lesson["type"].intValue
                                        newLesson.number = jsonLessonIndex
                                            let newDiscipline = APIDiscipline()
                                            newDiscipline.id = lesson["discipline"]["id"].intValue
                                            newDiscipline.name = lesson["discipline"]["name"].stringValue
                                            newDiscipline.full_name = lesson["discipline"]["full_name"].stringValue
                                        newLesson.discipline = newDiscipline
                                    
                                    if !(lesson["groups"].isEmpty) {
                                        for group in lesson["groups"].arrayValue {
                                            let newGroup = APIGroup()
                                            newGroup.id = group["id"].intValue
                                            newGroup.name = group["name"].stringValue
                                            newGroup.okr = group["okr"].intValue
                                            newGroup.type = group["type"].intValue
                                            newLesson.groups.append(newGroup)
                                        }
                                    }
                                    
                                    if !(lesson["teachers"].isEmpty) {
                                        for teacher in lesson["teachers"].arrayValue {
                                            let newTeacher = APITeacher()
                                            newTeacher.id = teacher["id"].intValue
                                            newTeacher.last_name = teacher["last_name"].stringValue
                                            newTeacher.first_name = teacher["first_name"].stringValue
                                            newTeacher.middle_name = teacher["middle_name"].stringValue
                                            newTeacher.name = teacher["name"].stringValue
                                            newTeacher.full_name = teacher["full_name"].stringValue
                                            newTeacher.short_name = teacher["short_name"].stringValue
                                            newTeacher.short_name_with_degree = teacher["short_name_with_degree"].stringValue
                                            newTeacher.degree = teacher["degree"].stringValue
                                            newLesson.teachers.append(newTeacher)
                                        }
                                    }
                                    
                                    if !(lesson["rooms"].isEmpty) {
                                        for room in lesson["rooms"].arrayValue {
                                            let newRoom = APIRoom()
                                            newRoom.id = room["id"].intValue
                                            newRoom.name = room["name"].stringValue
                                                let newBuilding = APIBuilding()
                                                newBuilding.id = room["building"]["id"].intValue
                                                newBuilding.name = room["building"]["name"].stringValue
                                                newBuilding.latitude = room["building"]["latitude"].doubleValue
                                                newBuilding.longitude = room["building"]["longitude"].doubleValue
                                            newRoom.building = newBuilding
                                            newLesson.rooms.append(newRoom)
                                        }
                                    }
                                    newDay.lessons.append(newLesson)
                                    
                                } else {
                                    // Creating lesson with exists = false property
                                    let newLesson = APILesson()
                                    newLesson.exists = false
                                    // Addind day to array
                                    newDay.lessons.append(newLesson)
                                }
                            }
                            newWeek1.days.append(newDay)
                        } else {
                            // Creating day with exists = false property
                            let newDay = APIDay()
                            newDay.exists = false
                            // Addind day to array
                            newWeek1.days.append(newDay)
                        }
                    }
                    schedule.weeks.append(newWeek1)
                } else {
                    // Creating week with exists = false property
                    let newWeek1 = APIWeek()
                    newWeek1.exists = false
                    // Addind week to array
                    schedule.weeks.append(newWeek1)
                }
                
                // if week2 exists
                if let jsonWeek2 = jsonData["2"]?.dictionary {
                    // create week1 array
                    let newWeek2 = APIWeek()
                    newWeek2.number = 2
                    // loop througth days
                    for jsonDayIndex in 1...7 {
                        // checking if day exists
                        if jsonWeek2["\(jsonDayIndex)"] != nil {
                            // Day exists
                            // DEBUG: print("day \(jsonDayIndex) exists")
                            let newDay = APIDay()
                            newDay.number = jsonDayIndex
                            // loop througth lessons
                            for jsonLessonIndex in 1...7 {
                                // if lesson exists
                                if jsonWeek2["\(jsonDayIndex)"]!["\(jsonLessonIndex)"] != nil {
                                    // Lesson exists
                                    // DEBUG: print("   lesson \(jsonLessonIndex) exists")
                                    let lesson = jsonWeek2["\(jsonDayIndex)"]!["\(jsonLessonIndex)"]
                                    let newLesson = APILesson()
                                    newLesson.id = lesson["id"].intValue
                                    newLesson.type = lesson["type"].intValue
                                    newLesson.number = jsonLessonIndex
                                    let newDiscipline = APIDiscipline()
                                    newDiscipline.id = lesson["discipline"]["id"].intValue
                                    newDiscipline.name = lesson["discipline"]["name"].stringValue
                                    newDiscipline.full_name = lesson["discipline"]["full_name"].stringValue
                                    newLesson.discipline = newDiscipline
                                    
                                    if !(lesson["groups"].isEmpty) {
                                        for group in lesson["groups"].arrayValue {
                                            let newGroup = APIGroup()
                                            newGroup.id = group["id"].intValue
                                            newGroup.name = group["name"].stringValue
                                            newGroup.okr = group["okr"].intValue
                                            newGroup.type = group["type"].intValue
                                            newLesson.groups.append(newGroup)
                                        }
                                    }
                                    
                                    if !(lesson["teachers"].isEmpty) {
                                        for teacher in lesson["teachers"].arrayValue {
                                            let newTeacher = APITeacher()
                                            newTeacher.id = teacher["id"].intValue
                                            newTeacher.last_name = teacher["last_name"].stringValue
                                            newTeacher.first_name = teacher["first_name"].stringValue
                                            newTeacher.middle_name = teacher["middle_name"].stringValue
                                            newTeacher.name = teacher["name"].stringValue
                                            newTeacher.full_name = teacher["full_name"].stringValue
                                            newTeacher.short_name = teacher["short_name"].stringValue
                                            newTeacher.short_name_with_degree = teacher["short_name_with_degree"].stringValue
                                            newTeacher.degree = teacher["degree"].stringValue
                                            newLesson.teachers.append(newTeacher)
                                        }
                                    }
                                    
                                    if !(lesson["rooms"].isEmpty) {
                                        for room in lesson["rooms"].arrayValue {
                                            let newRoom = APIRoom()
                                            newRoom.id = room["id"].intValue
                                            newRoom.name = room["name"].stringValue
                                            let newBuilding = APIBuilding()
                                            newBuilding.id = room["building"]["id"].intValue
                                            newBuilding.name = room["building"]["name"].stringValue
                                            newBuilding.latitude = room["building"]["latitude"].doubleValue
                                            newBuilding.longitude = room["building"]["longitude"].doubleValue
                                            newRoom.building = newBuilding
                                            newLesson.rooms.append(newRoom)
                                        }
                                    }
                                    newDay.lessons.append(newLesson)
                                    
                                } else {
                                    // Creating lesson with exists = false property
                                    let newLesson = APILesson()
                                    newLesson.exists = false
                                    // Addind day to array
                                    newDay.lessons.append(newLesson)
                                }
                            }
                            newWeek2.days.append(newDay)
                        } else {
                            // Creating day with exists = false property
                            let newDay = APIDay()
                            newDay.exists = false
                            // Addind day to array
                            newWeek2.days.append(newDay)
                        }
                    }
                    schedule.weeks.append(newWeek2)
                } else {
                    // Creating week with exists = false property
                    let newWeek2 = APIWeek()
                    newWeek2.exists = false
                    // Addind week to array
                    schedule.weeks.append(newWeek2)
                }

                
            }
            
            return schedule
            
        } else {
            
            return nil
            
    }
    
    
}




// GETTING OBJECTS FROM APISchedule OBJECT
func getAPIWeek(fromAPISchedule schedule: APISchedule, weekNumber week: Int) -> APIWeek {
    return schedule.weeks[week]
}

func getAPIDay(fromAPISchedule schedule: APISchedule, weekNumber week: Int, dayNumber day: Int) -> APIDay {
    return schedule.weeks[week].days[day]
}

func getAPILesson(fromAPISchedule schedule: APISchedule, weekNumber week: Int, dayNumber day: Int, lessonNumber lesson: Int) -> APILesson {
    return schedule.weeks[week].days[day].lessons[lesson]
}




// GETTING SCHEDULE OBJECTS COUNT
func getWeeksCount(fromAPISchedule schedule: APISchedule) -> Int {
    var num = 0
    for week in schedule.weeks {
        if week.exists == true {
            num += 1
        }
    }
    return num
}

func getDaysCount(fromAPISchedule schedule: APISchedule, weekNumber week: Int) -> Int {
    var num = 0
    for day in schedule.weeks[week].days {
        if day.exists == true {
            num += 1
        }
    }
    return num
}

func getLessonsCount(fromAPISchedule schedule: APISchedule, weekNumber week: Int, dayNumber day: Int) -> Int {
    var num = 7
    for lesson in schedule.weeks[week].days[day].lessons.reversed() {
        if lesson.exists == false {
            num -= 1
        } else {
            break
        }
    }
    return num
}




