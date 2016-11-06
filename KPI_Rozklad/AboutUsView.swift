//
//  AboutUsView.swift
//  KPI_Rozklad
//
//  Created by Alex on 11/6/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class AboutUsView: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBOutlet weak var BGImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.BGImageView.layer.opacity = 1
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2, delay: 0.1, animations: { () -> Void in
            self.BGImageView.layer.opacity = 0.2
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
