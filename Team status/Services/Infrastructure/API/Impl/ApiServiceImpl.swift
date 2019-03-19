//
//  ApiServiceImpl.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 2/2/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON
import Alamofire

final class ApiServiceImpl {

    static let shared: ApiService = ApiServiceImpl(parseService: ParseServiceImpl.shared)

    private let executor = Request.Executor.shared
    private let requestModelsFactory = Request.ModelsFactory.self
    private let parseService: ParseService

    init(parseService: ParseService) {
        self.parseService = ParseServiceImpl()
    }
}

extension ApiServiceImpl: ApiService {
    
    func getTeam(page: Int, completion: PagingTeamMembersCompletion?) {
        executor.requestJSON(model: requestModelsFactory.getTeam(page: page))
        { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let json):
                let members = strongSelf.parseService.parseTeam(json: json)
                guard var pagingModel = PagingModel(json: json) else {
                    completion?(Result.failure(TSError.parseError))
                    return
                }
                pagingModel.page += 1
                completion?(Result.success((members, pagingModel)))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }

    func getMembersBySkill(_ skill: String, completion: TeamMembersCompletion?) {
        executor.requestJSON(model: requestModelsFactory.getMembersBySkill(skill))
        { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let json):
                let members = strongSelf.parseService.parseTeam(json: json)
                completion?(Result.success(members))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }

    func getMembersByProject(_ project: Int, completion: TeamMembersCompletion?) {
        executor.requestJSON(model: requestModelsFactory.getMembersByProject(project))
        { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let json):
                let members = strongSelf.parseService.parseTeam(json: json)
                completion?(Result.success(members))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }

    func getMembersOnHoliday(completion: TeamMembersCompletion?) {
        executor.requestJSON(model: requestModelsFactory.getMembersOnHoliday())
        { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let json):
                let members = strongSelf.parseService.parseTeam(json: json)
                completion?(Result.success(members))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }

    func getWorkingMembers(completion: TeamMembersCompletion?) {
        executor.requestJSON(model: requestModelsFactory.getWorkingMembers())
        { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let json):
                let members = strongSelf.parseService.parseTeam(json: json)
                completion?(Result.success(members))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }
}
