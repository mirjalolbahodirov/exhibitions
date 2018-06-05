//
//  PhoneListPhoneListViewController.swift
//  Exhibitions
//
//  Created by Mirjalol on 05/06/2018.
//  Copyright © 2018 UranCompany. All rights reserved.
//

import UIKit
import SnapKit
import PKHUD

class PhoneListViewController: UIViewController, PhoneListViewInput {

    var output: PhoneListViewOutput!
    
    var tableView: UITableView!
    
    var items = [PhoneListItem]()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "iPhones"
        output.viewIsReady()
    }


    // MARK: PhoneListViewInput
    func setupInitialState() {
        view.backgroundColor = UIColor.white
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.separatorStyle = .none
        tableView.register(PhoneTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func showLoader() {
        HUD.show(.progress)
    }
    
    func hideLoader() {
        HUD.hide()
    }
    
    func setListData(items: [PhoneListItem]) {
        self.items = items
        tableView.reloadData()
    }
    
}

extension PhoneListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhoneTableViewCell
        cell.data = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178
    }
    
}
