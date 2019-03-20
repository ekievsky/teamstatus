//
//  Member.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON

struct Member {
    
    let id: String
    let lastName: String
    let firstName: String
    let onHolidaysTill: Date
    let freeSince: Date
    let isOnHolidays: Bool
    let isWorking: Bool
    let skills: [Skill]
    let manager: Manager
    let workingHours: WorkingHours
    let currentProject: Project

    init?(json: JSON) {
        guard let id = json["_id"].string else { return nil }
        self.id = id
        self.lastName = json["last_name"].stringValue
        self.firstName = json["first_name"].stringValue
        self.onHolidaysTill = json["on_holidays_till"].stringValue.fullDate ?? Date()
        self.freeSince = json["free_since"].stringValue.fullDate ?? Date()
        self.isOnHolidays = json["holidays"].boolValue
        self.isWorking = json["working"].boolValue

        let managerJSON = json["manager_id"]
        guard let manager = Manager(json: managerJSON) else { return nil }
        self.manager = manager

        let workingHoursJSON = json["working_hours"]
        let workingHours = WorkingHours(json: workingHoursJSON)
        self.workingHours = workingHours

        let currentProjectJSON = json["current_project"]
        guard let currentProject = Project(json: currentProjectJSON) else { return nil }
        self.currentProject = currentProject

        let skills = json["skills"].arrayValue
        self.skills = skills.map { Skill(json: $0) }
    }
}
