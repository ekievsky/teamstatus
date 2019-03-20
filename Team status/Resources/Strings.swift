//
//  Strings.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/20/19.
//  Copyright © 2019 ek. All rights reserved.
//

import Foundation

enum Strings {

    enum Common {
        static let cancel = Strings.localizedString("Localizable", "common.cancel")
        static let ok = Strings.localizedString("Localizable", "common.ok")
    }

    enum Error {
        static let noInternetConnection = Strings.localizedString("Localizable", "error.no_internet_connection")
        static let parseError = Strings.localizedString("Localizable", "error.parse_error")
        static let somethingWrong = Strings.localizedString("Localizable", "error.something_wrong")
    }

    enum MainScene {
        static let title = Strings.localizedString("Localizable", "main_scene.title")

        enum BarButton {
            static let title = Strings.localizedString("Localizable", "main_scene.bar_button.title")
        }
        
        enum ActionSheet {
            static let title = Strings.localizedString("Localizable", "main_scene.action_sheet.title")
            enum Action {
                static let getList = Strings.localizedString("Localizable", "main_scene.action_sheet.action.get_list")
                static let searchByProject = Strings.localizedString("Localizable", "main_scene.action_sheet.action.search_by_project")
                static let searchBySkill = Strings.localizedString("Localizable", "main_scene.action_sheet.action.search_by_skill")
                static let showHolidays = Strings.localizedString("Localizable", "main_scene.action_sheet.action.show_holidays")
                static let showWorking = Strings.localizedString("Localizable", "main_scene.action_sheet.action.show_working")
            }
        }

        enum AssingInputAlert {
            static func message(_ variable: String) -> String {
                return Strings.localizedString("Localizable", "main_scene.assing_input_alert.message", variable)
            }
            static let title = Strings.localizedString("Localizable", "main_scene.assing_input_alert.title")
        }

        enum Cell {
            static let assignTitle = Strings.localizedString("Localizable", "main_scene.cell.assign_title")
            static let managerTitle = Strings.localizedString("Localizable", "main_scene.cell.manager_title")
            static let projectTitle = Strings.localizedString("Localizable", "main_scene.cell.project_title")
            static let skillsTitle = Strings.localizedString("Localizable", "main_scene.cell.skills_title")
            static let statusTitle = Strings.localizedString("Localizable", "main_scene.cell.status_title")
            static let untilTitle = Strings.localizedString("Localizable", "main_scene.cell.until_title")
            static let workingHoursTitle = Strings.localizedString("Localizable", "main_scene.cell.working_hours_title")
            static let workingStatus = Strings.localizedString("Localizable", "main_scene.cell.working_status")
            static let onHolidaysStatus = Strings.localizedString("Localizable", "main_scene.cell.on_holidays_status")
        }
    }
}

extension Strings {
    private static func localizedString(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: .main, comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}
