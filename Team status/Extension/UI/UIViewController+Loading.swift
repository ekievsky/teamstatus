//
//  UIViewController+Loading.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import MBProgressHUD

extension UIViewController {

    func showLoading() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }

    func hideLoading() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
