//
//  UIViewController+Alert.swift
//  Forecast
//
//  Created by Evgenii Kyivskyi on 1/25/19.
//  Copyright © 2019 Evgenii Kyivskyi. All rights reserved.
//

import UIKit

extension UIViewController {

    func show(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }

    func show(error: TSError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
}

