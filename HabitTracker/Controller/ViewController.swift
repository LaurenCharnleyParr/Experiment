//
//  ViewController.swift
//  HabitTracker
//
//  Created by kristian & lauren parr on 06/05/2020.
//  Copyright © 2020 Lauren Charnley-Parr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var habitItems : [HabitModel] = [HabitModel(name: "run", done: [false, false, false]), HabitModel(name: "cook", done: [false, false, false])]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.register(UINib(nibName: "HabitCell", bundle: nil), forCellReuseIdentifier: "HabitCell")
    }

    
    @IBAction func addPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController.init(title: "Add a new habit", message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Add", style: .default) { (action) in
            // what the action does
            var newHabit = HabitModel()
            newHabit.name = textField.text!
            newHabit.done.append(false)
            print(newHabit)
            self.habitItems.append(newHabit)
            print(self.habitItems)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
    
    
}

//MARK: -
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
//        return habitItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as! HabitCell


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         print("indexPath: \(indexPath.row)")
    }
    
   
    
}

//@IBAction func buttonPressed(_ sender: UIButton) {
//        let button = sender
//        let emptyCircle = UIImage(systemName: "circle")
//        let fullCircle = UIImage(systemName: "circle.fill")
////        let tag = sender.tag
//        let buttonName = sender.titleLabel?.text!
//        switch buttonName {
////        switch tag {
//            case "Button1":
//            // button1 UIimage turns to filled circle, toggle done property
//                // sets done property at indexPath for particular habit.
//
//             func getIndexPath() -> IndexPath? {
//                    guard let superView = self.superview as? UITableView else {
//                        print("superview is not a UITableView - getIndexPath")
//                        return nil
//                    }
//                   let indexPath = superView.indexPath(for: self)
//
//                print("indexPath: \(indexPath)")
//                return indexPath
//                }
//
//                var habit = viewController.habitItems[0]
//                print("buttonTag: \(button.tag)")
//                let buttonRow = button.tag - 1
//
//
//                if habit.done[buttonRow] == true {
//                let image = UIImage(systemName: "circle")
//                sender.setImage(image, for: .normal)
//                } else if habit.done[buttonRow] == false {
//                let image = UIImage(systemName: "circle.fill")
//                sender.setImage(image, for: .normal)
//                }
//                print("habit: \(habit), habit.done: \(habit.done)")
//                habit.done[0] = !habit.done[0]
//                print("habit.done: \(habit.done)")
//
//
////                if (button.currentImage?.isEqual(fullCircle))! {
////                    print("case1")
////                let image = UIImage(systemName: "circle")
////                button.setImage(image, for: .normal)
////                } else if (button.currentImage?.isEqual(emptyCircle))! {
////                    print("case1")
////                let image = UIImage(systemName: "circle.fill")
////                button.setImage(image, for: .normal)
////            }
//            print("button1 pressed")
//        case "Button2":
//            // button2 UIimage turns to filled circle, toggle done property
//            if button.currentImage == fullCircle {
//                print("case2")
//                let image = UIImage(systemName: "circle")
//                button.setImage(image, for: .normal)
//            } else if button.currentImage == emptyCircle {
//                print("case2")
//                let image = UIImage(systemName: "circle.fill")
//                button.setImage(image, for: .normal)
//            }
//            print("button2 pressed")
//        case "Button3":
//            // button3 UIimage turns to filled circle, toggle done property
//            if button.currentImage == UIImage(systemName: "circle.fill") {
//                let image = UIImage(systemName: "circle")
//                button.setImage(image, for: .normal)
//            } else if button.currentImage == UIImage(systemName: "circle"){
//                let image = UIImage(systemName: "circle.fill")
//                button.setImage(image, for: .normal)
//            }
//            print("button3 pressed")
//        case "Button4":
//            // button4 UIimage turns to filled circle, toggle done property
//            let image = UIImage(systemName: "circle.fill")
//            sender.setImage(image, for: .normal)
//            toggleDoneProperty(with: button)
//            print("button4 pressed")
//        case "Button5":
//            // button5 UIimage turns to filled circle, toggle done property
//            let image = UIImage(systemName: "circle.fill")
//            sender.setImage(image, for: .normal)
//            toggleDoneProperty(with: button)
//            print("button5 pressed")
//        case "Button6":
//            // button6 UIimage turns to filled circle, toggle done property
//            let image = UIImage(systemName: "circle.fill")
//            sender.setImage(image, for: .normal)
//            toggleDoneProperty(with: button)
//            print("button6 pressed")
//        case "Button7":
//            // button6 UIimage turns to filled circle, toggle done property
//            let image = UIImage(systemName: "circle.fill")
//            sender.setImage(image, for: .normal)
//            toggleDoneProperty(with: button)
//            print("button7 pressed")
//        default:
//            print("error with sender.tag on Habit cell")
//        }
//    }
//
//    //MARK: - Toggle function
//    func toggleDoneProperty(with button: UIButton) {
//
//        if button.imageView == UIImage(systemName: "circle.fill") {
//            let image = UIImage(systemName: "circle")
//            button.setImage(image, for: .normal)
//        } else if button.imageView == UIImage(systemName: "circle"){
//            let image = UIImage(systemName: "circle.fill")
//            button.setImage(image, for: .normal)
//        }
//    }
//
//}
