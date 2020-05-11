//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Arjun Baru on 10/05/20.
//  Copyright © 2020 Arjun Baru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    var dataSource: [String] = ["Mumbai", "Bangalore", "Jammu", "Pune", "Hydrabad", "Jaipur", "Udaipur", "Kashmir", "Guwahati", "Ahemdabad", "Surat", "Nagpur", "Indore", "Bhopal"]

    let navigationTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "Cities"
        return label
    }()

    lazy var navigationBar: CustomNavigationBar = {
        return CustomNavigationBar(animatingView: self.navigationTitle, animationStyle: .leftToCenter)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension ViewController {
    func setupUI() {
        view.addSubview(navigationTitle)
        view.addSubview(navigationBar)
        view.addSubview(tableView)


        tableView.edgesToSuperview(excluding: .top, usingSafeArea: true)
        navigationBar.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        navigationBar.height(60)
        navigationBar.bottomToTop(of: tableView)

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError()
        }
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.navigationBar.animateInRelationTo(value: self.tableView.contentOffset.y)
    }
}

