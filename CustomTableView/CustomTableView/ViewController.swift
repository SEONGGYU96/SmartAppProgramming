//
//  ViewController.swift
//  CustomTableView
//
//  Created by 김성규 on 2020/12/16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellTableIdentifier = "CellTableIdentifier"
    
    let computers = [
        ["Name" : "MacBook Air", "Color" : "Silver"],
         ["Name" : "MacBook Pro", "Color" : "Silver"],
         ["Name" : "iMac", "Color" : "Silver"],
         ["Name" : "Mac Mini", "Color" : "Silver"],
        ["Name" : "Mac Pro", "Color" : "Black"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(NameAndColorCell.self, forCellReuseIdentifier: cellTableIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! NameAndColorCell
        let rowData = computers[indexPath.row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!
        
        return cell
    }
}

