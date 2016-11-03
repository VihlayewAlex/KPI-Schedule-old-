//
//  main.swift
//  KPIRozkladJSON
//
//  Created by Alex on 10/8/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation

let apiUrl = "http://api.rozklad.hub.kpi.ua/groups/497/timetable.json"

func getJSONData(urlString: String) -> APIData {
    let schedule = APIData()
    
    if let url = URL(string: urlString) {
        if let data = try? Data(contentsOf: url) {
            let json = JSON(data: data)
            
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
                                    
                                }
                            }
                            newWeek1.days.append(newDay)
                        }
                    }
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
                                    
                                }
                            }
                            newWeek2.days.append(newDay)
                        }
                    }
                    schedule.weeks.append(newWeek2)
                }

                
            }
            
            
        }
    }
    
    return schedule
}

let test_schedule = getJSONData(urlString: apiUrl)


// DEBUG RUN

/*
for week in test_schedule.weeks {
    print("WEEK \(week.number)")
    for day in week.days {
        print("DAY \(day.number)")
        for lesson in day.lessons {
            print("\t[\(lesson.number)]: \(lesson.discipline.full_name)")
            switch lesson.type {
                case 0:
                print("\t\tТип: Лекция")
                case 1:
                print("\t\tТип: Практика")
                case 2:
                print("\t\tТип: Лабораторная")
                default:
                print("\t\tТип: ?")
            }
            for teacher in lesson.teachers {
                print("\t\tПреподаватель: \(teacher.full_name)")
            }
            print("\t\tМесто:")
            for room in lesson.rooms {
                print("\t\t\t\(room.name)-\(room.building.name)")
                print("\t\t\tШирота: \(room.building.latitude) Долгота: \(room.building.longitude)")
            }
            print("\t\tГруппы:")
            for group in lesson.groups {
                print("\t\t\t\(group.name):")
                switch group.okr {
                case 0:
                    print("\t\t\t\tокр: Бакалавр")
                case 1:
                    print("\t\t\t\tокр: Магистр")
                case 2:
                    print("\t\t\t\tокр: Специалист")
                default:
                    print("\t\t\t\tокр: ?")
                }
                switch group.type {
                case 0:
                    print("\t\t\t\tформа обучения: Дневная")
                case 1:
                    print("\t\t\t\tформа обучения: Заочная")
                default:
                    print("\t\t\t\tформа обучения: ?")
                }
            }
            print("\n")
        }
        print("\n\n")
    }
    print("\n\n")
}

*/


