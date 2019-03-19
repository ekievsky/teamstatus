//
//  MainSceneDataSource.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import UIKit

final class MainSceneDataSource: NSObject {

    private var members: [Member] = []

    var pagingModel: PagingModel = .initial
    var itemsCount: Int {
        return members.count
    }

    func set(members: [Member]) {
        self.members = members
    }

    func add(members: [Member]) {
        self.members.append(contentsOf: members)
    }
}

// MARK: - UITableViewDataSource implementation
extension MainSceneDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: MainSceneItemCell.self, at: indexPath)
        cell.configure(with: members[indexPath.row])
        return cell
    }
}
