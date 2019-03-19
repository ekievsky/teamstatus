//
//  RequestModel.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 1/24/19.
//  Copyright © 2019 Evgenii Kyivskyi. All rights reserved.
//

import Foundation
import Alamofire

extension Request {

    struct Model {
        
        let endpoint: String
        let methodType: HTTPMethod
        let parameters: Parameters?
        let encoding: ParameterEncoding

        init(endpoint: String, methodType: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding) {
            self.endpoint = endpoint
            self.methodType = methodType
            self.parameters = parameters
            self.encoding = encoding
        }
    }
}
