//
//  TeamDataProviderService.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Foundation

final class TeamDataProviderService {

    private let apiService: ApiService

    init(apiService: ApiService) {
        self.apiService = apiService
    }
}

extension TeamDataProviderService: TeamDataProviding {

    func getTeam(page: Int, completion: PagingTeamMembersCompletion?) {
        apiService.getTeam(page: page, completion: completion)
    }

    func getMembersBySkill(_ skill: String, completion: TeamMembersCompletion?) {
        apiService.getMembersBySkill(skill, completion: completion)
    }

    func getMembersByProject(_ project: Int, completion: TeamMembersCompletion?) {
        apiService.getMembersByProject(project, completion: completion)
    }

    func getMembersOnHoliday(completion: TeamMembersCompletion?) {
        apiService.getMembersOnHoliday(completion: completion)
    }

    func getWorkingMembers(completion: TeamMembersCompletion?) {
        apiService.getWorkingMembers(completion: completion)
    }
}
