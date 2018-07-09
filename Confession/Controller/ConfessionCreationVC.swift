//
//  ConfessionCreationVC.swift
//  Confession
//
//  Created by Deepansh Saini on 05/01/18.
//  Copyright © 2018 Ardhendu Shekhar Mishra. All rights reserved.
//

import UIKit
import CoreData

class ConfessionCreationVC: UIViewController, UITextViewDelegate{

    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var confessionTextDescription: UITextView!
    
//    var confessionDescription : String!
//
//    func initData(description: String){
//        self.confessionDescription = description
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.bindToKeyboard()
        confessionTextDescription.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        if confessionTextDescription.text != "" && confessionTextDescription.text != "Type your confession here." {
            self.save(completetion: { (complete) in
                if complete{
                    dismiss(animated: true, completion: nil)
                }
            })
        }
        
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        confessionTextDescription.text = ""
        confessionTextDescription.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    func save(completetion: (_ finished: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{ return }
        let confession = Confession(context: managedContext)
        
        confession.confessionDescription = confessionTextDescription.text
        do{
            try managedContext.save()
            print("successfully saved data")
            completetion(true)
        }catch{
            debugPrint("could not save: \(error.localizedDescription)")
            completetion(false)
        }
    }
    
    
    
    
    
}
