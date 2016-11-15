//
//  ChooseGroupView.swift
//  KPI_Rozklad
//
//  Created by Alex on 11/7/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class ChooseGroupView: UITableViewController {
    
    
    
    var groupsList: [APIGroup] = []
    var indexPathOfSelectedRow: IndexPath!
    var selectedRowGroupID: Int!
    var selectedRowGroupNAME: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.global(qos: .background).async {
            // Get schedule
            
            var urlString = "http://api.rozklad.hub.kpi.ua/groups/?limit=50"
            
            repeat {
                
                let groupsFragmentResponse = getGroupFragmentResponse(fromURLString: urlString)
                
                if (groupsFragmentResponse.0 != nil) {
                    
                    DispatchQueue.main.async {
                        self.groupsList += (groupsFragmentResponse.0)!
                        self.tableView.reloadData()
                    }
                    
                } else {
                    
                    DispatchQueue.main.async {
                        self.groupsList = []
                    }
                    
                    break
                }
                
                if groupsFragmentResponse.1 != nil {
                    urlString = (groupsFragmentResponse.1)!
                }
                
            } while (getGroupFragmentResponse(fromURLString: urlString).1 != nil)
            
            
            print("\nDEBUG: Loading done\n")
            
            if self.groupsList.count == 0 {
                
                let alert = UIAlertController(title: "No connection", message: "Cannot load groups due to no internet access. Reconnect and try again.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: { (ACTION) -> Void in
                    _ = self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
                
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsList.count
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
