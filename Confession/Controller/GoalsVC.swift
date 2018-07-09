//
//  GoalsVC.swift
//  Confession
//
//  Created by Deepansh Saini on 05/01/18.
//  Copyright © 2018 Ardhendu Shekhar Mishra. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate


class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var confessions = [Confession]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()

    }
    
    func fetchCoreDataObjects() {
        self.fetch { (complete) in
            if complete {
                if confessions.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addConfessionBtnWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createConfessionVC") else{
            return }
        presentDetail(createGoalVC)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return confessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell") as? ConfessionCell else { return UITableViewCell()  }
        
        let confession = confessions[indexPath.row]
        
        print("\(confessions)")
        //cell.configureCell(confession: confession)
        cell.confessionLbl.text = confession.confessionDescription
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath)
            in
            self.removeConfession(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        
        return [deleteAction]
    }
    
    
}

extension GoalsVC {
    func removeConfession(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(confessions[indexPath.row])
        
        do {
            try managedContext.save()
            print("Successfully removed goal!")
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    
    
    func fetch(completion: (_ complete: Bool) -> ()){
        guard let managedContex = appDelegate?.persistentContainer.viewContext else{return}
        let fetchRequest = NSFetchRequest<Confession>(entityName: "Confession")
        do{
            confessions = try managedContex.fetch(fetchRequest)
            print("Successfully fetched data")
            completion(true)
        } catch{
            debugPrint("could not fetch \(error.localizedDescription)")
            completion(false)
        }
    }
}






