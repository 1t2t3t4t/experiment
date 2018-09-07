//
//  TableViewController.swift
//  OPOP
//
//  Created by Nathakorn on 9/4/18.
//  Copyright © 2018 Nathakorn. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TableViewController: UITableViewController {

//    let str = "Hello mate. Im from thaiLand Lolbr , Break Thru."
    let str = "สวัสดีครับผมนะ ครับงงๆ แฟลทปลาทองงงจ้าจ้าจ้าดุ่"
    var ast: [NSAttributedString] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...1000 {
            let c = Int(arc4random_uniform(20))
            ast.append(NSAttributedString(string: String(repeating: str, count: c), attributes: [.foregroundColor: UIColor.red]))
        }
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ast.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        cell.lbl.attributedText = ast[indexPath.row]
        return cell
    }

}
