//
//  JSONParsing.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON

protocol JSONParsing: class {

    func parseTeam(json: JSON) -> [Member]
}
