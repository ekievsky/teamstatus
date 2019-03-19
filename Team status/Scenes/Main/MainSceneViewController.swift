//
//  MainSceneViewController.swift
//  Team status
//
//  Created by Evgenii Kyivskyi on 3/19/19.
//  Copyright © 2019 ek. All rights reserved.
//

import UIKit

final class MainSceneViewController: UIViewController {

    // MARK: Injections
    private let teamService: TeamService = TeamServiceImpl.shared

    // MARK: Views
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.register(cellType: MainSceneItemCell.self)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        tv.allowsSelection = false
        tv.separatorStyle = .none
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 100
        tv.dataSource = dataSource
        tv.delegate = self
        tv.refreshControl = refreshControl
        return tv
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:#selector(refreshControlAction(_:)), for: .valueChanged)
        return refreshControl
    }()

    private lazy var dataSource: MainSceneDataSource = {
        let ds = MainSceneDataSource()
        return ds
    }()

    private var filterButton: UIBarButtonItem!

    private var mode: MainSceneMode = .list

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Actions
private extension MainSceneViewController {

    @objc
    func filterButtonAction(_ barButtonItem: UIBarButtonItem) {
        showActionSheet()
    }

    @objc
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        dataSource.pagingModel = .initial
        getTeam()
    }
}

// MARK: - UITableViewDelegate implementation
extension MainSceneViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > dataSource.itemsCount - 2 && dataSource.pagingModel.hasNext && mode == .list {
            getTeam()
        }
    }
}

// MARK: - Private  setup
private extension MainSceneViewController {

    func setup()  {
        setupNavigation()
        setupTableView()
        getTeam(shouldShowLoading: true)
    }

    func setupTableView() {
        view.addSubview(tableView)

        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func setupNavigation() {
        let button = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.edit,
            target: self,
            action: #selector(filterButtonAction(_:))
        )
        navigationItem.rightBarButtonItem = button
        filterButton = button
        navigationItem.title = "Team status"
    }
}

// MARK: - Action sheet
private extension MainSceneViewController {

    func showActionSheet() {
        let actioSheet = UIAlertController(
            title: "Please select filter",
            message: nil,
            preferredStyle: .actionSheet
        )

        let list = UIAlertAction(title: "Get list", style: .default) { [weak self] _ in
            self?.getTeam(shouldShowLoading: true)
        }

        let working = UIAlertAction(title: "Show working", style: .default) { [weak self] _ in
            self?.getWorking()
        }

        let onHolidays = UIAlertAction(title: "Show holidays", style: .default) { [weak self] _ in
            self?.getOnHolidays()
        }

        let projectSearch = UIAlertAction(title: "Search by project", style: .default) { [weak self] _ in
            self?.searchByProject(1)
        }

        let skillSearch = UIAlertAction(title: "Search by Skill", style: .default) { [weak self] _ in
            self?.searchBySkill("")
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        actioSheet.addAction(list)
        actioSheet.addAction(working)
        actioSheet.addAction(onHolidays)
        actioSheet.addAction(projectSearch)
        actioSheet.addAction(skillSearch)
        actioSheet.addAction(cancel)

        present(actioSheet, animated: true, completion: nil)
    }
}

// MARK: - Network requests
private extension MainSceneViewController {

    func getTeam(shouldShowLoading: Bool = false) {
        tableView.refreshControl = refreshControl
        shouldShowLoading ? showLoading() : ()
        teamService.getTeam(page: dataSource.pagingModel.page)
        { [weak self] result in
            self?.mode = .list
            self?.hideLoading()
            self?.refreshControl.endRefreshing()
            switch result {
            case .success(let response):
                self?.dataSource.add(members: response.0)
                self?.dataSource.pagingModel = response.1
                self?.tableView.reloadData()
            case .failure(let error):
                self?.show(error: error)
            }
        }
    }

    func getWorking() {
        showLoading()
        teamService.getWorkingMembers { [weak self] result in
            self?.hideLoading()
            self?.handleResult(result)
        }
    }

    func getOnHolidays() {
        showLoading()
        teamService.getMembersOnHoliday { [weak self] result in
            self?.hideLoading()
            self?.handleResult(result)
        }
    }

    func searchBySkill(_ skill: String) {
        showLoading()
        teamService.getMembersBySkill(skill) { [weak self] result in
            self?.hideLoading()
            self?.handleResult(result)
        }
    }

    func searchByProject(_ project: Int) {
        showLoading()
        teamService.getMembersByProject(project) { [weak self] result in
            self?.hideLoading()
            self?.handleResult(result)
        }
    }

    func handleResult(_ result: Result<[Member]>) {
        hideLoading()
        mode = .filter
        tableView.refreshControl = nil
        switch result {
        case .success(let response):
            dataSource.set(members: response)
            tableView.reloadData()
        case .failure(let error):
            show(error: error)
        }
    }
}
