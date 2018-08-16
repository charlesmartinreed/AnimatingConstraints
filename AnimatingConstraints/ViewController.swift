//
//  ViewController.swift
//  AnimatingConstraints
//
//  Created by Charles Martin Reed on 8/16/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leftDoor: UIView!
    @IBOutlet weak var rightDoor: UIView!
    
    var doorOpen = false
    
    func triggerDoor() {
        //force the layout to update itself, even if we haven't animated yet
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 3, animations: {
            //if door is open, set the constraint such that the door is open, i.e, collapse the view by changing the constraint to 0
            self.leftConstraint.constant = self.doorOpen ? 0 : -self.leftDoor.frame.size.width
            self.rightConstraint.constant = self.doorOpen ? 0 : -self.rightDoor.frame.size.width
            
            //update the layout
            self.view.layoutIfNeeded()
            
        }) { (success) in
            self.doorOpen = self.doorOpen ? false : true
            self.triggerDoor()
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        triggerDoor()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

