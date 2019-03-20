//
//  RequestExecuting.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/20/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol RequestExecuting: class {

    typealias BaseJSONResponse = (Result<JSON>) -> Void
    
    @discardableResult
    func requestJSON(model: Request.Model, completion: @escaping BaseJSONResponse) -> DataRequest
}
