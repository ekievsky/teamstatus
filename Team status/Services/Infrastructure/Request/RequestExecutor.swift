//
//  NetworkManager.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 1/24/19.
//  Copyright © 2019 Evgenii Kyivskyi. All rights reserved.
//

import Alamofire
import SwiftyJSON

class Request { }

extension Request {

    final class Executor {

        typealias BaseJSONResponse = (Result<JSON>) -> Void

        static let shared = Executor()

        private let manager : SessionManager
        
        private init() {
            self.manager = SessionManager(configuration: .default)
        }
    }
}

extension Request.Executor {

    @discardableResult
    func requestJSON(model: Request.Model, completion: @escaping BaseJSONResponse) -> DataRequest {
        return manager.request(model.endpoint,
                               method: model.methodType,
                               parameters: model.parameters,
                               encoding: model.encoding,
                               headers: nil)
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let json = JSON(value)
                    completion(Result.success(json))
                case .failure(let error):
                    if (error as NSError).code == NSURLErrorNotConnectedToInternet {
                        completion(Result.failure(TSError.noInternetConnection))
                    }
                    completion(Result.failure(TSError.generalError))
                }
        }
    }
}
