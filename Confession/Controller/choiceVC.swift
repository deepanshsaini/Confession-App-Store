//
//  choiceVC.swift
//  Confession
//
//  Created by Deepansh Saini on 06/01/18.
//  Copyright © 2018 Ardhendu Shekhar Mishra. All rights reserved.
//

import UIKit

class choiceVC: UIViewController {

    @IBOutlet weak var writeConfessionBtn: UIButton!
    @IBOutlet weak var speakConfessionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        writeConfessionBtn.layer.borderColor = UIColor.white.cgColor
//        writeConfessionBtn.layer.borderWidth = 0.1
//        writeConfessionBtn.layer.cornerRadius = 0.4
//        speakConfessionBtn.layer.borderColor = UIColor.white.cgColor
//        speakConfessionBtn.layer.borderWidth = 0.1
//        speakConfessionBtn.layer.cornerRadius = 0.4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
