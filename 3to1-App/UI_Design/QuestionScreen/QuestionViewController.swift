//
//  QuestionViewController.swift
//  UI_Design
//
//  Created by Shadow Song on 12/25/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit


class QuestionViewController: UIViewController {

    var countDown = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    
    var questionContent: String?
    
    //var time = 10
    //var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questionContent
        //Changes the background of the main view.
        self.view.addBackground(imageName: "Background.png")
        
        
        //Start a time session for the user to answer questions
        //startTimeSession()
        
//        let rootref = Database.database().reference()
//        let NewCountDownRef = rootref.child("/DB1_0/Game/game(idFDFDS)/CurrentQuestion/")
//        NewCountDownRef.observe(.value){ (snapshot) in
//            let countDownDict = snapshot.value as? [String : AnyObject] ?? [:]
//            let countDownSB = countDownDict["countDown"] as? String
//            self.countDown = countDownSB ??  ""
//            if self.countDown != ""{
//                self.performSegue(withIdentifier: "waitToQuestion", sender: self)
//                self.countDown = ""
//
//            }
//
//        }
        
    }
    //DO NOT DELETE THIS PART
    //[OLD VERSION with old database]
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        let NewQuestionRef = rootref.child("Game").child("Game_ID_"+gameID).child("CurrentQuestion")
    //        NewQuestionRef.observe(.value){ (snapshot) in
    //            let questionDict = snapshot.value as? [String : AnyObject] ?? [:]
    //            let questionSB = questionDict["Q_ID"] as? String
    //            self.question = questionSB ??  ""
    //            if self.question != ""{
    //                self.performSegue(withIdentifier: "waitToQuestion", sender: self)
    //                self.question = ""
    //
    //            }
    //
    //        }
    //
    //    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let rootref = Database.database().reference()

  
            let countDownDict = snapshot.value as? [String : AnyObject] ?? [:]
            let countDownSB = countDownDict["countDown"] as? Int
            if countDownSB != nil{
                self.countDown = String(countDownSB!)
            //if self.countDown != ""{
                self.countDownLabel.text = self.countDown
//                self.performSegue(withIdentifier: "waitToQuestion", sender: self)
//                self.countDown = ""
                
            }
            else{
                NewCountDownRef.removeAllObservers()
                self.performSegue(withIdentifier: "questionToWait", sender: self)
            }
        }
        
    }


    //***********************Time Section*************************************//
//    func startTimeSession(){
//        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionController.action), userInfo: nil, repeats: true)
//
//        //time = 10
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionViewController.countdonwAction), userInfo: nil, repeats: true)
//    }
//
//    @objc func countdonwAction(){
//        if(time == 0){
//            countDownLabel.text = "0"
//            timer.invalidate()
//            sessionOver()
//        }
//        else{
//            time -= 1
//            countDownLabel.text = String (time)
//
//        }
//    }
//
//
//    func sessionOver(){
//        //Add code here for What to do after session is over.
//        //self.performSegue(withIdentifier: "questionToWait", sender: self)
//    }
    //************************Timer Section Over*****************************//
}
