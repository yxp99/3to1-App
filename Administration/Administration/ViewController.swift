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
    public static func mktemp<T>(body: (Path) throws -> T) throws -> T {
        #if !os(Linux)
        let url = try FileManager.default.url(for: .itemReplacementDirectory, in: .userDomainMask, appropriateFor: URL(fileURLWithPath: "/"), create: true)
        #else
        let envs = ProcessInfo.processInfo.environment
        let env = envs["TMPDIR"] ?? envs["TEMP"] ?? envs["TMP"] ?? "/tmp"
        let dir = Path.root/env/"swift-sh.XXXXXX"
        var template = [UInt8](dir.string.utf8).map({ Int8($0) }) + [Int8(0)]
        guard mkdtemp(&template) != nil else { throw CocoaError.error(.featureUnsupported) }
        let url = URL(fileURLWithPath: String(cString: template))
        #endif
        defer { _ = try? FileManager.default.removeItem(at: url) }
        return try body(Path(string: url.path))
    }
    
}

