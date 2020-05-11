//
//  ViewController.swift
//  HabitTracker
//
//  Created by kristian & lauren parr on 06/05/2020.
//  Copyright © 2020 Lauren Charnley-Parr. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    let realm = try! Realm()
//    var habitItems : Results<HabitModel>?
    
    var habitItems : [HabitModel] = [HabitModel(name: "run", done: [false, false, false]), HabitModel(name: "cook", done: [true, false, false]), HabitModel(name: "meditate", done: [true, true, false]), HabitModel(name: "make bed", done: [true, true, true])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HabitCell", bundle: nil), forCellReuseIdentifier: "HabitCell")
//        loadItems()
    }
    
    @IBAction func addPressed(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController.init(title: "Add a new habit", message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Add", style: .default) { (action) in
            // what the action does
            var newHabit = HabitModel()
            newHabit.name = textField.text!
            newHabit.done.append(false)
            self.habitItems.append(newHabit)
            print(newHabit)
//           
//            self.realm.add(newHabit)
            
//            self.habitItems.append(newHabit)
//            print(self.habitItems)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - loadItems()
//    func loadItems() {
//        habitItems = realm.objects(HabitModel.self)
//        print(habitItems)
//        tableView.reloadData()
//    }
    
    @IBAction func testPressed(_ sender: UIButton) {
    }
    
} // class end

//MARK: - TableView Methods
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as! HabitCell
        cell.numberLabel.text = String(indexPath.row)
        
        for button in [cell.button1, cell.button2, cell.button3, cell.button4] {
            if indexPath.row < (habitItems[(button!.tag)-1].done.count) {
                let isDone = habitItems[(button!.tag)-1].done[indexPath.row]
                
                let image = isDone ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
                button?.setImage(image, for: .normal)
                //
            } else {//indexPath.row > count
                // set to false (append) and change UI
                let difference = indexPath.row - ((habitItems[button!.tag-1].done.count) - 1)
                habitItems[button!.tag-1].done.append(contentsOf: Array(repeating: false, count: difference))
//                    try! realm.write {
//                        habitItems?[button!.tag-1].done.append(objectsIn: appendingArray)
//                    }
                let isDone = habitItems[(button!.tag)-1].done[indexPath.row]
                
                let image = isDone ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
                button?.setImage(image, for: .normal)
                }
        } // for in
        return cell
    } // ()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}// extension class end

