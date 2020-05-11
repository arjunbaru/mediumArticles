//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Arjun Baru on 10/05/20.
//  Copyright © 2020 Arjun Baru. All rights reserved.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    var dataSource: [String] = ["Mumbai", "Bangalore", "Jammu", "Pune", "Hydrabad", "Jaipur", "Udaipur", "Kashmir", "Guwahati", "Ahemdabad", "Surat", "Nagpur", "Indore", "Bhopal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension ViewController {
    func setupUI() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
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
}

