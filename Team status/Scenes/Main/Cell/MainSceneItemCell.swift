//
//  MainSceneItemCellTableViewCell.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import UIKit

final class MainSceneItemCell: UITableViewCell {

    @IBOutlet private var shadowView: UIView!

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var projectNameLabel: UILabel!
    @IBOutlet private var managerLabel: UILabel!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var untilContainerView: UIView!
    @IBOutlet private var untilLabel: UILabel!
    @IBOutlet private var fromLabel: UILabel!
    @IBOutlet private var toLabel: UILabel!
    @IBOutlet private var skillsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.applyShadow()
    }

    func configure(with member: Member) {
        nameLabel.text = "\(member.firstName) \(member.lastName)"
        projectNameLabel.text = member.currentProject.projectName
        managerLabel.text = "\(member.manager.firstName) \(member.manager.lastName)"
        fromLabel.text = "\(member.workingHours.start.time)"
        toLabel.text = "\(member.workingHours.end.time)"
        skillsLabel.text = member.skills.map { $0.name }.joined(separator: ", ")

        if member.isOnHolidays {
            statusLabel.textColor = .accentRed
            statusLabel.text = "On Holidays"
            untilLabel.text = "\(member.onHolidaysTill.fullDay)"
            untilContainerView.isHidden = false
        } else {
            statusLabel.textColor = .accentGreen
            statusLabel.text = "Working"
            untilContainerView.isHidden = true
        }
    }
}
