//
//  QuestionViewController.swift
//  UI_Design
//
//  Created by Shadow Song on 12/25/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {


    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    
    var questionContent: String?
    
    var time = 10
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questionContent
        //Changes the background of the main view.
        self.view.addBackground(imageName: "Background.png")
        
        
        //Start a time session for the user to answer questions
        startTimeSession()
        
    }
    


    //***********************Time Section*************************************//
    func startTimeSession(){
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionController.action), userInfo: nil, repeats: true)
        
        //time = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuestionViewController.countdonwAction), userInfo: nil, repeats: true)
    }
    
    @objc func countdonwAction(){
        if(time == 0){
            countDownLabel.text = "0"
            timer.invalidate()
            sessionOver()
        }
        else{
            time -= 1
            countDownLabel.text = String (time)
            
        }
    }
    
    
    func sessionOver(){
        //Add code here for What to do after session is over.
        //self.performSegue(withIdentifier: "questionToWait", sender: self)
    }
    //************************Timer Section Over*****************************//
}
