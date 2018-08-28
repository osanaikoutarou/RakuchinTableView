//
//  ViewController.swift
//  RakuchinTableView
//
//  Created by osanai on 2018/08/28.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hogeTableView: UITableView!
    
    enum Section {
        case section1
        case section2
        case section3
    }
    enum Cell {
        case aaa
        case bbb
        case ccc
    }
    
    let sections:[Section] = [.section1,
                              .section2,
                              .section3]
    let cells:[Section:[Cell]] = [.section1:[.aaa,.bbb,.ccc],
                                  .section2:[.aaa,.aaa,.bbb,.bbb,.ccc,.ccc],
                                  .section3:[.ccc,.ccc,.ccc]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hogeTableView.delegate = self
        hogeTableView.dataSource = self
        hogeTableView.rowHeight = UITableViewAutomaticDimension
        
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[sections[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cells[sections[indexPath.section]]![indexPath.row]
        
        switch cell {
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

