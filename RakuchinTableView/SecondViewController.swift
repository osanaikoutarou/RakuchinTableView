//
//  ViewController.swift
//  RakuchinTableView
//
//  Created by osanai on 2018/08/28.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var hogeTableView: UITableView!
    
    enum CellType {
        case aaa
        case bbb
        case ccc
    }
    
    enum UserType {
        case normal
        case premium
    }
    
    var userType:UserType = .normal
    
    func cellTypes() -> [CellType] {
        switch userType {
        case .normal:
            return [.aaa,.bbb,.bbb]
        case .premium:
            return [.aaa,.bbb,.bbb,.ccc,.ccc]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hogeTableView.delegate = self
        hogeTableView.dataSource = self
        hogeTableView.rowHeight = UITableViewAutomaticDimension
        
    }
}

extension SecondViewController: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes()[indexPath.row]
        
        switch cellType {
        case .aaa:
            let cell = tableView.dequeueReusableCell(with: AAATableViewCell.self, for: indexPath)
            return cell
        case .bbb:
            let cell = tableView.dequeueReusableCell(with: BBBTableViewCell.self, for: indexPath)
            return cell
        case .ccc:
            let cell = tableView.dequeueReusableCell(with: CCCTableViewCell.self, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderTableViewCell")
        return header
    }
    
}

