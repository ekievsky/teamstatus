//
//  MainSceneItemCellTableViewCell.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import UIKit

protocol MainSceneItemCellDelegate: class {
    func mainSceneItemCellAssignButtonDidClick(_ mainSceneItemCell: MainSceneItemCell,
                                               button: UIButton, at indexPath: IndexPath)
}

final class MainSceneItemCell: UITableViewCell {

    @IBOutlet private var shadowView: UIView!

    @IBOutlet private var nameLabel: UILabel!

    @IBOutlet private var projectTitleLabel: UILabel!
    @IBOutlet private var projectNameLabel: UILabel!

    @IBOutlet private var managerTitleLabel: UILabel!
    @IBOutlet private var managerLabel: UILabel!

    @IBOutlet private var statusTitleLabel: UILabel!
    @IBOutlet private var statusLabel: UILabel!

    @IBOutlet private var untilTitleLabel: UILabel!
    @IBOutlet private var untilContainerView: UIView!
    @IBOutlet private var untilLabel: UILabel!

    @IBOutlet private var workingHoursTitleLabel: UILabel!
    @IBOutlet private var fromLabel: UILabel!
    @IBOutlet private var toLabel: UILabel!

    @IBOutlet private var skillsTitleLabel: UILabel!
    @IBOutlet private var skillsLabel: UILabel!

    @IBOutlet private var assignButton: UIButton!

    private var indexPath: IndexPath!

    weak var delegate: MainSceneItemCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.applyShadow()
        setupLocalization()
    }

    func configure(with member: Member, at indexPath: IndexPath) {
        self.indexPath = indexPath
        nameLabel.text = "\(member.firstName) \(member.lastName)"
        projectNameLabel.text = member.currentProject.projectName
        managerLabel.text = "\(member.manager.firstName) \(member.manager.lastName)"
        fromLabel.text = "\(member.workingHours.start.time)"
        toLabel.text = "\(member.workingHours.end.time)"
        skillsLabel.text = member.skills.map { $0.name }.joined(separator: ", ")

        if member.isOnHolidays {
            statusLabel.textColor = .accentRed
            statusLabel.text = Strings.MainScene.Cell.onHolidaysStatus
            untilLabel.text = "\(member.onHolidaysTill.fullDay)"
            untilContainerView.isHidden = false
        } else {
            statusLabel.textColor = .accentGreen
            statusLabel.text = Strings.MainScene.Cell.workingStatus
            untilContainerView.isHidden = true
        }
    }

    @IBAction
    private func assignButtonAction(_ sender: UIButton) {
        delegate?.mainSceneItemCellAssignButtonDidClick(self, button: sender, at: indexPath)
    }
}

private extension MainSceneItemCell {
    func setupLocalization() {
        projectTitleLabel.text = Strings.MainScene.Cell.projectTitle
        managerTitleLabel.text = Strings.MainScene.Cell.managerTitle
        statusTitleLabel.text = Strings.MainScene.Cell.statusTitle
        untilTitleLabel.text = Strings.MainScene.Cell.untilTitle
        workingHoursTitleLabel.text = Strings.MainScene.Cell.workingHoursTitle
        skillsTitleLabel.text = Strings.MainScene.Cell.skillsTitle
        assignButton.setTitle(Strings.MainScene.Cell.assignTitle, for: .normal)
    }
}
