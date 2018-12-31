//
//  ViewController.swift
//  Administration
//
//  Created by Shadow Song on 12/27/18.
//  Copyright © 2018 Shadow Song. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var fieldGoalButton: DLRadioButton!
    @IBOutlet weak var timeButton: DLRadioButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //This line allows multiple selection
        //fieldGoalButton.isMultipleSelectionEnabled = true
        
        //This method is in addBackground.swift
        //self.view.addBackground(imageName: "Background.png")
    }

    @IBAction func clickQuestion(_ sender: DLRadioButton) {
        if sender.tag == 1{
            print("field goal")
        }
        else{
            print("3rd down")
        }
    }
    
    @IBAction func clickTimeButton(_ sender: DLRadioButton) {
        if sender.tag == 3{
            print("10s")
        }
        else if sender.tag == 4{
            print("15s")
        }
        else{
            print("20s")
        }
    }
    
    @IBAction func clickSend(_ sender: Any) {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("/DB1_0/Game/game(idFDFDS)/CurrentQuestion/").setValue(["content": "this content", "countDown": 5])
    }
    
}

