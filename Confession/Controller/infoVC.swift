//
//  infoVC.swift
//  Confession
//
//  Created by Deepansh Saini on 06/01/18.
//  Copyright © 2018 Ardhendu Shekhar Mishra. All rights reserved.
//

import UIKit

class infoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnPressed(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }

}
