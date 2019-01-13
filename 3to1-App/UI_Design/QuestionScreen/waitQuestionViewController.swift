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
    
    var questionHere = false
    
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
        - (void)revealController:(SWRevealViewController *)revealController willAddViewController:(UIViewController *)viewController
    forOperation:(SWRevealControllerOperation)operation animated:(BOOL)animated;
- (void)revealController:(SWRevealViewController *)revealController didAddViewController:(UIViewController *)viewController
    forOperation:(SWRevealControllerOperation)operation animated:(BOOL)animated;

// Support for custom transition animations while replacing child controllers. If implemented, it will be fired in response
// to calls to 'setXXViewController' methods
- (id<UIViewControllerAnimatedTransitioning>)revealController:(SWRevealViewController *)revealController
    animationControllerForOperation:(SWRevealControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;

// DEPRECATED - The following delegate methods will be removed some time in the future
- (void)revealController:(SWRevealViewController *)revealController panGestureBeganFromLocation:(CGFloat)location progress:(CGFloat)progress; // (DEPRECATED)
- (void)revealController:(SWRevealViewController *)revealController panGestureMovedToLocation:(CGFloat)location progress:(CGFloat)progress; // (DEPRECATED)
- (void)revealController:(SWRevealViewController *)revealController panGestureEndedToLocation:(CGFloat)location progress:(CGFloat)progress; // (DEPRECATED)
@end


#pragma mark - UIViewController(SWRevealViewController) Category

// A category of UIViewController to let childViewControllers easily access their parent SWRevealViewController
@interface UIViewController(SWRevealViewController)

- (SWRevealViewController*)revealViewController;

@end
        /*  Changes the background of the main view.
        This method is in addBackground.swift  */
        self.view.addBackground(imageName: "Background.png")
        
        /* Refer to the firebase database */
        rootref = Database.database().reference()
        
//        let NewQuestionRef = rootref.child("/DB1_0/Game/game(idFDFDS)/CurrentQuestion/")
//        NewQuestionRef.observe(.value){ (snapshot) in
//            let questionDict = snapshot.value as? [String : AnyObject] ?? [:]
//            let questionSB = questionDict["content"] as? String
//            self.question = questionSB ??  ""
//            if self.question != ""{
//                return self.performSegue(withIdentifier: "waitToQuestion", sender: self)
//                //self.question = ""
//
//            }
//
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let NewQuestionRef = rootref.child("/DB1_0/Game/game(idFDFDS)/CurrentQuestion/")
        NewQuestionRef.observe(.value){ (snapshot) in
            let questionDict = snapshot.value as? [String : AnyObject] ?? [:]
            let questionSB = questionDict["content"] as? String
            self.question = questionSB ??  ""
            if self.question != ""{
                //questionHere = false
                
                //This FUCKIN line removes the FUCKING OBSERVER. SUPER IMPORTANT LINE
                NewQuestionRef.removeAllObservers()
                
                self.performSegue(withIdentifier: "waitToQuestion", sender: self)
                //self.question = ""
            }

        }
    }
    
    
    //Don't delete this part
    //[read only once]
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let NewQuestionRef = rootref.child("/DB1_0/Game/game(idFDFDS)/CurrentQuestion/")
//        NewQuestionRef.observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let questionDict = snapshot.value as? NSDictionary
//            let questionSB = questionDict?["content"] as? String ?? ""
//            self.question = questionSB
//            if self.question != ""{
//                return self.performSegue(withIdentifier: "waitToQuestion", sender: self)
//                //self.question = ""
//
//            }
//
//        })
//
//    }
    
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
    

    //DO NOT DELETE THIS PART
    //[OLD VERSION with old database]
//        override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//            let NewQuestionRef = rootref.child("Game").child("Game_ID_"+gameID).child("CurrentQuestion")
//            NewQuestionRef.observe(.value){ (snapshot) in
//                let questionDict = snapshot.value as? [String : AnyObject] ?? [:]
//                let questionSB = questionDict["Q_ID"] as? String
//                self.question = questionSB ??  ""
//                if self.question != ""{
//                    self.performSegue(withIdentifier: "waitToQuestion", sender: self)
//                    self.question = ""
//
//                }
//
//            }
//
//        }
    

}
