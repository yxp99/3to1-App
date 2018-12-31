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

    var questionContent = "nil"
    var countDownTime = 10
    
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
            questionContent = "Filed Goal"
        }
        else{
            questionContent = "3rd Down"
        }
    }
    
    @IBAction func clickTimeButton(_ sender: DLRadioButton) {
        if sender.tag == 3{
            countDownTime = 10
        }
        else if sender.tag == 4{
            countDownTime = 15
        }
        else{
            countDownTime = 20
        }
    }
    
    @IBAction func clickSend(_ sender: Any) {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("/DB1_0/Game/game(idFDFDS)/CurrentQuestion/").setValue(["content": questionContent, "countDown": countDownTime])
    }
    
}

