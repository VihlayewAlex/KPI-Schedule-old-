//
//  ViewController.swift
//  KPI_Rozklad
//
//  Created by Alex on 10/30/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit


class MainView: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Left menu view
    @IBOutlet weak var menuView: UIView!
    // Main app view
    @IBOutlet weak var mainContentView: UIView!
    // Left menu button
    @IBOutlet weak var menuButton: UIButton!
    // Sync button
    @IBOutlet weak var syncButton: UIButton!
    // Group name box
    @IBOutlet weak var groupRectangle: UIView!
    // Menu items images
    @IBOutlet weak var scheduleImage: UIImageView!
    @IBOutlet weak var tasksImage: UIImageView!
    @IBOutlet weak var notesImage: UIImageView!
    @IBOutlet weak var teachersImage: UIImageView!
    @IBOutlet weak var settingsImage: UIImageView!
    @IBOutlet weak var aboutUsImage: UIImageView!
    
    
    // ADD Views
    @IBOutlet weak var addTaskView: UIView!
    @IBOutlet weak var addNoteView: UIView!
    
    // ADD Image Views
    @IBOutlet weak var addTaskImageView: UIImageView!
    @IBOutlet weak var addNoteImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Expanding button reaction area with insets
        menuButton.imageEdgeInsets = UIEdgeInsetsMake(10, 15, 10, 15)
        syncButton.imageEdgeInsets = UIEdgeInsetsMake(8, 13, 8, 13)
        
        addTaskView.layer.cornerRadius = 4
        addNoteView.layer.cornerRadius = 4
        
        
        // Setup mainContentView shadow
        mainContentView.layer.shadowColor = UIColor.black.cgColor
        mainContentView.layer.shadowOpacity = 0.3
        mainContentView.layer.shadowOffset = CGSize.zero
        mainContentView.layer.shadowRadius = 10
        mainContentView.layer.shadowPath = UIBezierPath(rect: mainContentView.bounds).cgPath
        
        // Setting group menu button corner radius
        groupRectangle.layer.cornerRadius = 8.0
        
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        addTaskView.layer.shadowColor = UIColor.black.cgColor
        addTaskView.layer.shadowOpacity = 0.2
        addTaskView.layer.shadowRadius = 5
        addTaskView.layer.shadowOffset = CGSize.zero
        addTaskView.layer.shadowPath = UIBezierPath(rect: addTaskView.bounds).cgPath
        
        addNoteView.layer.shadowColor = UIColor.black.cgColor
        addNoteView.layer.shadowOpacity = 0.2
        addNoteView.layer.shadowRadius = 5
        addNoteView.layer.shadowOffset = CGSize.zero
        addNoteView.layer.shadowPath = UIBezierPath(rect: addTaskView.bounds).cgPath
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func menuScheduleButtonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 0.2
            self.scheduleImage.layer.opacity = 0.2
        })
    }
    @IBAction func menuScheduleButtonUntouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.scheduleImage.layer.opacity = 1.0
        })
    }
    @IBAction func menuScheduleButtonUntouchedOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.scheduleImage.layer.opacity = 1.0
        })
    }
    
    
    @IBAction func menuTasksButtonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 0.2
            self.tasksImage.layer.opacity = 0.2
        })
    }
    @IBAction func menuTasksButtonUntouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.tasksImage.layer.opacity = 1.0
        })
    }
    @IBAction func menuTasksButtonUntouchedOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.tasksImage.layer.opacity = 1.0
        })
    }
    
    
    @IBAction func menuNotesButtonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 0.2
            self.notesImage.layer.opacity = 0.2
        })
    }
    @IBAction func menuNotesButtonUntouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.notesImage.layer.opacity = 1.0
        })
    }
    @IBAction func menuNotesButtonUntouchedOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.notesImage.layer.opacity = 1.0
        })
    }
    
    
    @IBAction func menuTeachersButtonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 0.2
            self.teachersImage.layer.opacity = 0.2
        })
    }
    @IBAction func menuTeachersButtonUntouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.teachersImage.layer.opacity = 1.0
        })
    }
    @IBAction func menuTeachersButtonUntouchedOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.teachersImage.layer.opacity = 1.0
        })
    }
    
    
    @IBAction func menuSettingsButtonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 0.2
            self.settingsImage.layer.opacity = 0.2
        })
    }
    @IBAction func menuSettingsButtonUntouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.settingsImage.layer.opacity = 1.0
        })
    }
    @IBAction func menuSettingsButtonUntouchedOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.settingsImage.layer.opacity = 1.0
        })
    }
    
    
    @IBAction func menuAboutUsButtonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 0.2
            self.aboutUsImage.layer.opacity = 0.2
        })
    }
    @IBAction func menuAboutUsButtonUntouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.aboutUsImage.layer.opacity = 1.0
        })
    }
    @IBAction func menuAboutUsButtonUntouchedOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.aboutUsImage.layer.opacity = 1.0
        })
    }
    
    
    
    // MENU
    
    var menuIsOpen = false
    @IBAction func menuShowButtonTouched() {
        if menuIsOpen != true {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.mainContentView.frame.origin.x = 220
            }, completion: { (Bool) -> Void in
                self.menuIsOpen = true
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.mainContentView.frame.origin.x = 0
            }, completion: { (Bool) -> Void in
                self.menuIsOpen = false
            })
        }
    }
    
    
    //Action, called when user performed a slide action
    @IBAction func leftMenuMainContentSlideAction(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            //Started interaction
            
            //Setting translation
            let translation = sender.translation(in: self.view)
            
            //Setting custom center position
            var xPos = sender.view!.center.x + translation.x
            if xPos - sender.view!.frame.width/2 < 0 {
                xPos = 0 + sender.view!.frame.width/2
            }
            
            //Setting center to X-position
            sender.view?.center.x = xPos
            
            //Performing translation
            sender.setTranslation(CGPoint.zero, in: self.view)
            
        }
        if sender.state == .ended {
            //Eded interaction
            
            /*

             Animations for LEFT MENU, based on the:
                1) X-coordinate of view;
                2) Menu state (opened / closed);
             Can be adjusted by editing values and
             adding more animation points.
             
            */
            
            if sender.view!.frame.origin.x < 20 {
                UIView.animate(withDuration: 0.2, animations: { () -> Void in
                    sender.view!.frame.origin.x = 0
                }, completion: { (Bool) -> Void in
                    self.menuIsOpen = false
                })
            } else if sender.view!.frame.origin.x < 170 {
                
                if menuIsOpen == true {
                    UIView.animate(withDuration: 0.2, animations: { () -> Void in
                        sender.view!.frame.origin.x = 0
                    }, completion: { (Bool) -> Void in
                        self.menuIsOpen = false
                    })
                } else {
                    UIView.animate(withDuration: 0.2, animations: { () -> Void in
                        sender.view!.frame.origin.x = 220
                    }, completion: { (Bool) -> Void in
                        self.menuIsOpen = true
                    })
                }
                
            } else {
                UIView.animate(withDuration: 0.2, animations: { () -> Void in
                    sender.view!.frame.origin.x = 220
                }, completion: { (Bool) -> Void in
                    self.menuIsOpen = true
                })
            }
        }
    }
    
    // Add task
    @IBAction func addTaskTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.addTaskImageView.layer.opacity = 0.5
            sender.layer.opacity = 0.5
        }, completion: { (Bool) -> Void in
            UIView.animate(withDuration: 0.1, delay: 0.2, animations: { () -> Void in
                self.addTaskImageView.layer.opacity = 1
                sender.layer.opacity = 1
            })
        })
    }
    
    
   
    
    
    // Add note
    @IBAction func addNoteTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.addNoteImageView.layer.opacity = 0.5
            sender.layer.opacity = 0.5
        }, completion: { (Bool) -> Void in
            UIView.animate(withDuration: 0.1, delay: 0.2, animations: { () -> Void in
                self.addNoteImageView.layer.opacity = 1
                sender.layer.opacity = 1
            })
        })
    }
    
    

}

