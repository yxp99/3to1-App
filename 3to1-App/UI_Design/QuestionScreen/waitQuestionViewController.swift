//
//  waitQuestionViewController.swift
//  UI_Design
//
//  Created by Shadow Song on 12/27/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit
import FirebaseDatabase
class waitQuestionViewController: UIViewController {
    // Variables
    var question = ""
    var gameID = "0"
    var rootref : DatabaseReference!
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        /*  Set up the side menu animation.
        This method is in ViewControllerHelper.swift  */
        sideMenu()
        
        /*  Set up Navigation Bar 3to1 logo
        This method is in ViewControllerHelper.swift */
        customizeNavigationBar()
        
        /*  Changes the background of the main view.
        This method is in addBackground.swift  */
        self.view.addBackground(imageName: "Background.png")
        
        /* Refer to the firebase database */
        rootref = Database.database().reference()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let NewQuestionRef = rootref.child("Game").child("Game_ID_"+gameID).child("CurrentQuestion")
        NewQuestionRef.observe(.value){ (snapshot) in
            let questionDict = snapshot.value as? [String : AnyObject] ?? [:]
            let questionSB = questionDict["Q_ID"] as? String
            self.question = questionSB ??  ""
            if self.question != ""{
                self.performSegue(withIdentifier: "waitToQuestion", sender: self)
                self.question = ""

            }
            
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "waitToQuestion"{
            if let destinationVC = segue.destination as? QuestionViewController{
                destinationVC.questionContent = self.question
            }
        }
    }
    @IBAction func clickQuestionHere(_ sender: Any) {
        self.performSegue(withIdentifier: "waitToQuestion", sender: self)
    }
    


}