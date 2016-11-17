//
//  ChooseGroupView.swift
//  KPI_Rozklad
//
//  Created by Alex on 11/7/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class ChooseGroupView: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var loader: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var groupsList: [APIGroup] = []
    var groupsListBackup: [APIGroup] = []
    
    var indexPathOfSelectedRow: IndexPath!
    var selectedRowGroupID: Int!
    var selectedRowGroupNAME: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        
        
        loader.layer.cornerRadius = 5
        tableView.isUserInteractionEnabled = false
        searchBar.isUserInteractionEnabled = false
        saveButton.isEnabled = false
        
        
        
        
        // START DATA LOAD IN BACKGROUND
        DispatchQueue.global(qos: .background).async {
            
            // first page url
            var urlString = "http://api.rozklad.hub.kpi.ua/groups/?limit=100"
            
            // Groups load loop
            while (getGroupFragmentResponse(fromURLString: urlString).0 != nil) {
                
                // Receiving data from JSON
                let groupsFragmentResponse: ([APIGroup]?,String?) = getGroupFragmentResponse(fromURLString: urlString)
                
                
                if groupsFragmentResponse.0 == nil {        // If resonse array is empty
                    self.groupsList = []
                    break
                } else {        // If data is OK
                    
                    var indexPathArr : [IndexPath] = []
                    
                    for group in groupsFragmentResponse.0! {
                        indexPathArr.append( IndexPath(row: group.id-1, section: 0) )
                    }
                    
                    self.groupsList += (groupsFragmentResponse.0)!
                    self.groupsListBackup = self.groupsList
                    
                    DispatchQueue.main.async {
                        self.tableView.beginUpdates()
                        self.tableView.insertRows(at: indexPathArr, with: UITableViewRowAnimation.fade)
                        self.tableView.endUpdates()
                    }
                    
                }
                
                if groupsFragmentResponse.1 != nil {
                    urlString = (groupsFragmentResponse.1)!
                } else {
                    break
                }
                
            }
            
            
            
            print("\nDEBUG: Loading done. Preparing UI.\n")
            
            // If list is empty after loading
            if self.groupsList.count == 0 {
                
                DispatchQueue.main.async {
                    self.loader.removeFromSuperview()
                    let alert = UIAlertController(title: "No connection", message: "Cannot load groups due to no internet access. Reconnect and try again.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: { (ACTION) -> Void in
                        _ = self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                DispatchQueue.main.async {
                    self.tableView.isUserInteractionEnabled = true
                    self.searchBar.isUserInteractionEnabled = true
                    self.saveButton.isEnabled = true
                    self.loader.removeFromSuperview()
                }
            }
            
            
        }
        

        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func saveGroup(_ sender: UIBarButtonItem) {
        // SAVE GROUP
        if selectedRowGroupID != nil {
            UserDefaults.standard.set(selectedRowGroupID, forKey: "groupID")
            UserDefaults.standard.set(selectedRowGroupNAME, forKey: "groupNAME")
        } else {
            
            let alert = UIAlertController(title: "Group not selected", message: "Select your group and tap 'Save' again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Back to settings", style: UIAlertActionStyle.default, handler: { (ACTION) -> Void in
                _ = self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        
        cell.textLabel?.text = groupsList[indexPath.row].name
        
        if indexPathOfSelectedRow != nil {
            if indexPathOfSelectedRow.row == indexPath.row {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowGroupID = groupsList[indexPath.row].id
        selectedRowGroupNAME = groupsList[indexPath.row].name
        if indexPathOfSelectedRow != nil {
            tableView.cellForRow(at: indexPathOfSelectedRow)?.accessoryType = UITableViewCellAccessoryType.none
        }
        tableView.deselectRow(at: indexPath, animated: true)
        indexPathOfSelectedRow = indexPath
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
    }
 
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        if !searchText.isEmpty {
            
            var groupsListFiltered: [APIGroup] = []
        
            for group in groupsListBackup {
                if group.name.hasPrefix(searchText.lowercased()) {
                    groupsListFiltered.append(group)
                }
            }
        
            groupsList = groupsListFiltered
            self.tableView.reloadData()
            
        } else {
            self.groupsList = self.groupsListBackup
            self.tableView.reloadData()
        }
        
    }
    
    
    
    
}
