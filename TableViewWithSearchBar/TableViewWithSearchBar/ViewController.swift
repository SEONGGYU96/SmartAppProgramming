//
//  ViewController.swift
//  TableViewWithSearchBar
//
//  Created by 김성규 on 2020/12/16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let sectionsTableIndentifier = "SectionsTableIdentifier"
    var names: [String: [String]]!
    var keys: [String]!
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIndentifier)
        
        let path = Bundle.main.path(forResource: "sortednames", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as? [String: [String]]
        keys = (namesDict!.allKeys as! [String]).sorted()
        
        let resultController = SearchResultController()
        resultController.names = names
        resultController.keys = keys
        searchController = UISearchController(searchResultsController: resultController)
        
        let searchBar = searchController.searchBar
        searchBar.scopeButtonTitles = ["All", "Short", "Long"]
        searchBar.placeholder = "Enter a search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultController
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIndentifier)!
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
}

