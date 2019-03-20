//
//  JSONParserService.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import SwiftyJSON

final class JSONParserService: JSONParsing {

    func parseTeam(json: JSON) -> [Member] {
        let items = json["items"].arrayValue
        let members = items.compactMap { Member(json: $0) }

        return members
    }
}
