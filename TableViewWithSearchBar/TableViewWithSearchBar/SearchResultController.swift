//
//  SearchResultController.swift
//  TableViewWithSearchBar
//
//  Created by 김성규 on 2020/12/23.
//

import UIKit

class SearchResultController: UITableViewController, UISearchResultsUpdating {
    
    private static let longNameSize = 6
    private static let shortNamesButtonIndex = 1
    private static let longNamesButtonIndex = 2

    let sectionTableIdentifier = "SectionsTableIdentifier"
    var names: [String: [String]] = [String: [String]]()
    var keys: [String] = []
    var filteredNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionTableIdentifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return filteredNames.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionTableIdentifier)
        cell!.textLabel?.text = filteredNames[indexPath.row]
        return cell!
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text {
            let buttonIndex = searchController.searchBar.selectedScopeButtonIndex
            filteredNames.removeAll(keepingCapacity: true)
            
            if (!searchString.isEmpty) {
                let filter: (String) -> Bool = { name in
                    let nameLength = name.count
                    if (buttonIndex == SearchResultController.shortNamesButtonIndex && nameLength >= SearchResultController.longNameSize) || (buttonIndex == SearchResultController.longNamesButtonIndex && nameLength < SearchResultController.longNameSize) {
                        return false
                    }
                    
                    let range = name.range(of: searchString, options: NSString.CompareOptions.caseInsensitive, range: nil, locale: nil)
                    return range != nil
                }
                for key in keys {
                    let namesForkey = names[key]!
                    let matches = namesForkey.filter(filter)
                    filteredNames += matches
                }
                print(filteredNames)
            }
        }
        tableView.reloadData()
    }
    
}
