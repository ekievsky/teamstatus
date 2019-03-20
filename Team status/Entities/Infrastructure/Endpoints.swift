//
//  Endpoints.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Foundation

extension Request {

    private enum Constants {
        static let baseURL = "https://testapi.io/api/ekievsky"
    }

    enum Endpoints {
        case team(Int)
        case membersBySkill(String)
        case membersByProject(Int)
        case membersOnHoliday
        case workingMembers
    }
}

extension Request.Endpoints {

    var string: String {
        switch self {
        case .team(let page):
            let uri = page > 1 ? "team/page=\(page)" : "team"
            return "\(Request.Constants.baseURL)/\(uri)"
        case .membersBySkill(_):
            return "\(Request.Constants.baseURL)/team/skill=js&skill=python"
        case .membersByProject(_):
            return "\(Request.Constants.baseURL)/team/project=2"
        case .membersOnHoliday:
            return "\(Request.Constants.baseURL)/team/holidays=true"
        case .workingMembers:
            return "\(Request.Constants.baseURL)/team/working=true"
        }
    }
}
