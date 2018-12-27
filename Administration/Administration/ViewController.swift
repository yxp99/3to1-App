//
//  ViewController.swift
//  Administration
//
//  Created by Shadow Song on 12/27/18.
//  Copyright © 2018 Shadow Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //This method is in addBackground.swift
        self.view.addBackground(imageName: "Background.png")
    }

    @IBAction func handleAddQuestion(_ sender: Any) {
    }
    
    @IBAction func handleDeleteQuestion(_ sender: Any) {
    }
}

