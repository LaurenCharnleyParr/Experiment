//
//  HabitCell.swift
//  HabitTracker
//
//  Created by kristian & lauren parr on 10/05/2020.
//  Copyright © 2020 Lauren Charnley-Parr. All rights reserved.
//

import UIKit
import RealmSwift

class HabitCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var habitLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    let vc = ViewController()
    let realm = try! Realm()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        loadUI()
        // Initialization code
        
    }

    //MARK: - ButtonPressed()
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    let indexPath = getIndexPath()
//    print("IP: \(indexPath)")
        if let indexPathRow = indexPath?.row {
//        print("IPR: \(indexPathRow)")
            
            let tag = sender.tag
//            print("sender.tag: \(sender.tag)")
            switch tag {
            case 1:
                toggle(tag: tag, indexPathRow: indexPathRow, sender: sender)
                print("button1 pressed")
            case 2:
                toggle(tag: tag, indexPathRow: indexPathRow, sender: sender)
                print("button2 pressed")
            case 3:
                toggle(tag: tag, indexPathRow: indexPathRow, sender: sender)
                print("button3 pressed")
            case 4:
                toggle(tag: tag, indexPathRow: indexPathRow, sender: sender)
                print("button4 pressed")
            default:
                print("error with sender.tag")
            }
        }
    }//()
    
    //MARK: - GetIndexPath()
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        let indexPathReturned = superView.indexPath(for: self)
        return indexPathReturned
    }
    
    //MARK: - Toggle()
    
    func toggle(tag: Int, indexPathRow: Int, sender: UIButton) {
        
        if indexPathRow > (vc.habitItems[tag-1].done.count - 1) {
            let difference = indexPathRow - (vc.habitItems[tag-1].done.count - 1)
            let appendingArray = Array(repeating: false, count: difference)
            vc.habitItems[tag-1].done.append(contentsOf: Array(repeating: false, count: difference))
//                 try! realm.write{
//                    vc.habitItems[tag-1].done.append(objectsIn: appendingArray)
//                 }
            
        } // if index out of range, append false onto array
        vc.habitItems[tag-1].done[indexPathRow] = !vc.habitItems[tag-1].done[indexPathRow]
        
        let isDone = vc.habitItems[tag-1].done[indexPathRow]
        print("\(vc.habitItems[tag-1].name) - \(isDone)")
        if isDone == true {
            let image = UIImage(systemName: "circle.fill")
            sender.setImage(image, for: .normal)
        } else if isDone == false {
            let image = UIImage(systemName: "circle")
            sender.setImage(image, for: .normal) }
        print("toggled: \(isDone)")
    } //()
    
    
    
} // class end
