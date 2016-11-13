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
        UserDefaults.standard.removeObject(forKey: "schedule")
    }

}
