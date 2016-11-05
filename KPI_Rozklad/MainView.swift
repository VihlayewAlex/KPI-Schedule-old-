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
    
    // ROOT VIEWS
        // Left menu root view
        @IBOutlet weak var menuView: UIView!
        // Main screen root view
        @IBOutlet weak var mainContentView: UIView!
    
    // NAVIGATION BAR
        // Navigation button for menu opening
        @IBOutlet weak var menuButton: UIButton!
        // Sync button
        @IBOutlet weak var syncButton: UIButton!
    
    // MENU
        // Group name box
        @IBOutlet weak var groupRectangle: UIView!
        // Menu button images
        @IBOutlet weak var scheduleImage: UIImageView!
        @IBOutlet weak var tasksImage: UIImageView!
        @IBOutlet weak var notesImage: UIImageView!
        @IBOutlet weak var teachersImage: UIImageView!
        @IBOutlet weak var settingsImage: UIImageView!
        @IBOutlet weak var aboutUsImage: UIImageView!
    
    // ADD TASK/NOTE BUTTONS
        // Add note
        @IBOutlet weak var addTaskView: UIView!
        @IBOutlet weak var addTaskButton: UIButton!
        var addTaskButtonIsHighlighted = false
        // Add note
        @IBOutlet weak var addNoteView: UIView!
        @IBOutlet weak var addNoteButton: UIButton!
        var addNoteButtonIsHighlighted = false
    
    // ALL CONTENT BUTTONS
        // All Notes
        @IBOutlet weak var allNotes: UIView!
        @IBOutlet weak var allNotesBg: UIView!
        var allNotesIsHighlighted = false
        // All Tasks
        @IBOutlet weak var allTasks: UIView!
        @IBOutlet weak var allTasksBg: UIView!
        var allTasksIsHighlighted = false
    
    // FAST SCHEDULE LIST
    @IBOutlet weak var fastScheduleList: UIView!
    @IBOutlet weak var fastScheduleListBg: UIView!
    
    // SEE ALL BUTTON
    @IBOutlet weak var seeAllButton: UIButton!
    var seeAllIsHighlighted = false
    
    // When view is actualy loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Expanding button reaction area with insets
        menuButton.imageEdgeInsets = UIEdgeInsetsMake(10, 15, 10, 15)
        syncButton.imageEdgeInsets = UIEdgeInsetsMake(8, 13, 8, 13)
        
        // Setting ADD BUTTON view's layer properties
        addTaskView.layer.cornerRadius = 4
        addNoteView.layer.cornerRadius = 4
        
        // Setting ADD BUTTON's image content render-mode
        addTaskButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        addNoteButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
        // Setup main screen root view's shadow
        mainContentView.layer.shadowColor = UIColor.black.cgColor
        mainContentView.layer.shadowOpacity = 0.3
        mainContentView.layer.shadowOffset = CGSize.zero
        mainContentView.layer.shadowRadius = 10
        mainContentView.layer.shadowPath = UIBezierPath(rect: mainContentView.bounds).cgPath
        
        // Setting group menu button corner radius
        groupRectangle.layer.cornerRadius = 8.0
        
        // Setting SEE ALL button's layer properties
        seeAllButton.layer.cornerRadius = seeAllButton.frame.height/2
        seeAllButton.layer.borderColor = UIColor.white.cgColor
        seeAllButton.layer.borderWidth = 1
        
        
        
        
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
        
        // ALL NOTES
        allNotesBg.layer.shadowColor = UIColor.black.cgColor
        allNotesBg.layer.shadowOpacity = 0.5
        allNotesBg.layer.shadowRadius = 8
        allNotesBg.layer.shadowOffset = CGSize.zero
        allNotesBg.layer.shadowPath = UIBezierPath(rect: allNotesBg.bounds).cgPath
        let allNotesGradient = CAGradientLayer()
        allNotesGradient.frame = allNotesBg.bounds
        let allNotesColor1 = UIColor(red:0.35, green:0.40, blue:0.41, alpha:1.0).cgColor
        let allNotesColor2 = UIColor(red:0.33, green:0.31, blue:0.28, alpha:1.0).cgColor
        allNotesGradient.colors = [allNotesColor1,allNotesColor2]
        allNotesBg.layer.addSublayer(allNotesGradient)
        
        // ALL TASKS
        allTasksBg.layer.shadowColor = UIColor.black.cgColor
        allTasksBg.layer.shadowOpacity = 0.3
        allTasksBg.layer.shadowRadius = 5
        allTasksBg.layer.shadowOffset = CGSize.zero
        allTasksBg.layer.shadowPath = UIBezierPath(rect: allTasksBg.bounds).cgPath
        let allTasksGradient = CAGradientLayer()
        allTasksGradient.frame = allTasksBg.bounds
        let allTasksColor1 = UIColor(red:0.37, green:0.34, blue:0.31, alpha:1.0).cgColor
        let allTasksColor2 = UIColor(red:0.34, green:0.33, blue:0.32, alpha:1.0).cgColor
        allTasksGradient.colors = [allTasksColor1,allTasksColor2]
        allTasksBg.layer.addSublayer(allTasksGradient)
        
        // FAST SCHEDULE
        fastScheduleListBg.layer.shadowColor = UIColor.black.cgColor
        fastScheduleListBg.layer.shadowOpacity = 0.3
        fastScheduleListBg.layer.shadowRadius = 3
        fastScheduleListBg.layer.shadowOffset = CGSize.zero
        fastScheduleListBg.layer.shadowPath = UIBezierPath(rect: allTasks.bounds).cgPath
        let fastScheduleListGradient = CAGradientLayer()
        fastScheduleListGradient.frame = fastScheduleListBg.bounds
        let fastScheduleListColor1 = UIColor(red:0.24, green:0.24, blue:0.23, alpha:1.0).cgColor
        let fastScheduleListColor2 = UIColor(red:0.20, green:0.27, blue:0.28, alpha:1.0).cgColor
        let fastScheduleListColor3 = UIColor(red:0.08, green:0.09, blue:0.09, alpha:1.0).cgColor
        fastScheduleListGradient.colors = [fastScheduleListColor1,fastScheduleListColor2,fastScheduleListColor3]
        fastScheduleListGradient.locations = [0.0,0.3,1.0]
        fastScheduleListBg.layer.addSublayer(fastScheduleListGradient)
    }
    
    
    
    // FOR FUTURE UPDATES
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /* MENU BUTTON'S OUTLETS */
    
    
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
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.aboutUsImage.layer.opacity = 1.0
            self.mainContentView.frame.origin.x = 0
        })
    }
    @IBAction func menuAboutUsButtonUntouchedOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1.0
            self.aboutUsImage.layer.opacity = 1.0
        })
    }
    
    
    
    
    
    // MENU OPENING NAVIGATION BUTTON
    var menuIsOpen = false // menu state
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
    
    
    
    
    
    /* UI PAN GESTURE RECOGNIZER */
    
    // Action, called when user performed a slide action
    @IBAction func leftMenuMainContentSlideAction(_ sender: UIPanGestureRecognizer) {
        
        //Started interaction
        if sender.state == .began || sender.state == .changed {
            
            // DEHIGHLIGHT BUTTONS ON SWIPE
            
            if seeAllIsHighlighted == true {
                UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
                    self.seeAllButton.layer.opacity = 1
                })
                seeAllIsHighlighted = false
            }
            
            if addTaskButtonIsHighlighted == true {
                UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
                    self.addTaskView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.25)
                })
                addTaskButtonIsHighlighted = false
            }
            
            if addNoteButtonIsHighlighted == true {
                UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
                    self.addNoteView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.25)
                })
                addNoteButtonIsHighlighted = false
            }
            
            if allTasksIsHighlighted == true {
                UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
                    self.allTasks.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.0)
                })
                allTasksIsHighlighted = false
            }
            
            if allNotesIsHighlighted == true {
                UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
                    self.allNotes.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.0)
                })
                allNotesIsHighlighted = false
            }
            
            
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
        
        // Ended interaction
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
    
    
   
    
    // Add Task Actions
    @IBAction func addTaskTouchDown(_ sender: UIButton) {
        addTaskButtonIsHighlighted = true
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.addTaskView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.5)
        })
    }
    @IBAction func addTaskTouchUpInside(_ sender: UIButton) {
        addTaskButtonIsHighlighted = false
        UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
            self.addTaskView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.25)
        })
    }
    
    
    // Add Note Actions
    @IBAction func addNoteTouchDown(_ sender: UIButton) {
        addNoteButtonIsHighlighted = true
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.addNoteView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.5)
        })
    }
    @IBAction func addNoteTouchUpInside(_ sender: UIButton) {
        addNoteButtonIsHighlighted = false
        UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
            self.addNoteView.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.25)
        })
    }
    
    
    // All Notes Actions
    @IBAction func allNotesTouchDown(_ sender: UIButton) {
        allNotesIsHighlighted = true
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.allNotes.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.1)
        })
    }
    @IBAction func allNotesTouchUpInside(_ sender: UIButton) {
        allNotesIsHighlighted = false
        UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
            self.allNotes.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.0)
        })
    }
    
    
    // All Task Actions
    @IBAction func allTasksTouchDown(_ sender: UIButton) {
        allTasksIsHighlighted = true
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.allTasks.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.1)
        })
    }
    @IBAction func allTasksTouchUpInside(_ sender: UIButton) {
        allTasksIsHighlighted = false
        UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
            self.allTasks.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.0)
        })
    }
    
    
    // See all Actions
    @IBAction func seeAllTouch(_ sender: UIButton) {
        seeAllIsHighlighted = true
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            sender.layer.opacity = 0.3
        })
    }
    @IBAction func seeAllTouchUpInside(_ sender: UIButton) {
        seeAllIsHighlighted = false
        UIView.animate(withDuration: 0.1, delay: 0.1, animations: { () -> Void in
            sender.layer.opacity = 1
        })
    }
    

    
    
}

