//
//  RequestModelsFactory.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Alamofire

extension Request {

    enum ModelsFactory {

        static func getTeam(page: Int) -> Request.Model {
            return Request.Model(
                endpoint: Request.Endpoints.team(page).string,
                methodType: .get,
                parameters: nil,
                encoding: URLEncoding.default
            )
        }

        static func getMembersBySkill(_ skill: String) -> Request.Model {
            return Request.Model(
                endpoint: Request.Endpoints.membersBySkill(skill).string,
                methodType: .get,
                parameters: nil,
                encoding: URLEncoding.default
            )
        }

        static func getMembersByProject(_ project: Int) -> Request.Model {
            return Request.Model(
                endpoint: Request.Endpoints.membersByProject(project).string,
                methodType: .get,
                parameters: nil,
                encoding: URLEncoding.default
            )
        }

        static func getMembersOnHoliday() -> Request.Model {
            return Request.Model(
                endpoint: Request.Endpoints.membersOnHoliday.string,
                methodType: .get,
                parameters: nil,
                encoding: URLEncoding.default
            )
        }

        static func getWorkingMembers() -> Request.Model {
            return Request.Model(
                endpoint: Request.Endpoints.workingMembers.string,
                methodType: .get,
                parameters: nil,
                encoding: URLEncoding.default
            )
        }
    }
}
