//
//  List+Extensions.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 2/3/19.
//  Copyright © 2019 ek. All rights reserved.
//

import UIKit

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }

extension UITableView {

    func register<T: ReusableView>(cellType: T.Type = T.self, bundle: Bundle = .main) {
        let reuseIdentifier = cellType.defaultReuseIdentifier
        if bundle.path(forResource: reuseIdentifier, ofType: "nib") != nil {
            register(UINib(nibName: reuseIdentifier, bundle: bundle), forCellReuseIdentifier: reuseIdentifier)
        } else {
            register(cellType, forCellReuseIdentifier: reuseIdentifier)
        }
    }

    func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
        let reuseIdentifier = cellType.defaultReuseIdentifier
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(reuseIdentifier)")
        }
        return cell
    }

    func registerReusableView<E: UITableViewHeaderFooterView>(_ type: E.Type, bundle: Bundle = .main) {
        let reuseIdentifier = type.defaultReuseIdentifier
        if bundle.path(forResource: reuseIdentifier, ofType: "nib") != nil {
            register(UINib(nibName: reuseIdentifier, bundle: bundle), forHeaderFooterViewReuseIdentifier: reuseIdentifier)
        } else {
            register(type, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
        }
    }

    func dequeueReusableHeaderFooterView<E: UITableViewHeaderFooterView>(with type: E.Type) -> E {
        let reuseIdentifier = type.defaultReuseIdentifier
        guard let reusableView = dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? E else {
            fatalError("Could not dequeue reusable view with identifier: \(reuseIdentifier)")
        }
        return reusableView
    }

}
