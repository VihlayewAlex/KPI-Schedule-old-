//
//  ChooseGroupView.swift
//  KPI_Rozklad
//
//  Created by Alex on 11/7/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class ChooseGroupView: UITableViewController {

    
    var isLoadingGroups = false
    var groupsList: [APIGroup]!
    var indexPathOfSelectedRow: IndexPath!
    var selectedRowGroupID: Int!
    var selectedRowGroupNAME: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Preparing content
        isLoadingGroups = true
        DispatchQueue.global(qos: .background).async {
            // Get schedule
            
            
            if self.groupsList == nil {
                
                print("\nDEBUG: 'getGroupsList' method called.\n")
                self.groupsList = getGroupsList()
                print("\nDEBUG: 'getGroupsList' response is assigned to a groupsList variable.\n")
                
                if self.groupsList == nil {
                    
                    let alert = UIAlertController(title: "No connection", message: "Cannot load groups due to no internet access. Reconnect and try again.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: { (ACTION) -> Void in
                        _ = self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            }
            
            // Sync and update UI
            DispatchQueue.main.async {
                self.isLoadingGroups = false
                self.tableView.reloadData()
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if groupsList != nil {
            switch isLoadingGroups {
            case true:
                return 0
            default:
                return groupsList.count
            }
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowGroupID = groupsList[indexPath.row].id
        selectedRowGroupNAME = groupsList[indexPath.row].name
        if indexPathOfSelectedRow != nil {
            tableView.cellForRow(at: indexPathOfSelectedRow)?.accessoryType = UITableViewCellAccessoryType.none
        }
        tableView.deselectRow(at: indexPath, animated: true)
        indexPathOfSelectedRow = indexPath
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
    }

    
}
