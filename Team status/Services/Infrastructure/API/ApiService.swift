//
//  ApiService.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 2/2/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Alamofire

protocol ApiService: class {

    typealias PagingTeamMembersCompletion = (Result<([Member], PagingModel)>) -> Void

    func getTeam(page: Int, completion: PagingTeamMembersCompletion?)

    typealias TeamMembersCompletion = (Result<[Member]>) -> Void
    
    func getMembersBySkill(_ skill: String, completion: TeamMembersCompletion?)
    func getMembersByProject(_ project: Int, completion: TeamMembersCompletion?)
    func getMembersOnHoliday(completion: TeamMembersCompletion?)
    func getWorkingMembers(completion: TeamMembersCompletion?)
}
