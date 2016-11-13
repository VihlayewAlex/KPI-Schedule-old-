//
//  SettingsView.swift
//  KPI_Rozklad
//
//  Created by Alex on 11/7/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class SettingsView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.canCancelContentTouches = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func clearCache() {
        let clearConfirmView = UIAlertController(title: "Are you sure?", message: "All schedule data will be erased!", preferredStyle: UIAlertControllerStyle.actionSheet)
        let deleteConfirmAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: { (ACTION) -> Void in
            UserDefaults.standard.removeObject(forKey: "schedule")
        })
        let cancelConfirmAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        clearConfirmView.addAction(deleteConfirmAction)
        clearConfirmView.addAction(cancelConfirmAction)
        self.present(clearConfirmView, animated: true, completion: nil)
    }

}
