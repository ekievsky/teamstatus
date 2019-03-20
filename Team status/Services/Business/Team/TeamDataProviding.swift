//
//  TeamDataProviding.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Foundation

protocol TeamDataProviding: class {

    typealias PagingTeamMembersCompletion = (Result<([Member], PagingModel)>) -> Void

    func getTeam(page: Int, completion: PagingTeamMembersCompletion?)

    typealias TeamMembersCompletion = (Result<[Member]>) -> Void

    func getMembersBySkill(_ skill: String, completion: TeamMembersCompletion?)
    func getMembersByProject(_ project: Int, completion: TeamMembersCompletion?)
    func getMembersOnHoliday(completion: TeamMembersCompletion?)
    func getWorkingMembers(completion: TeamMembersCompletion?)
}
