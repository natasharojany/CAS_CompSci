//
//  ViewController.swift
//  Scheldue
//
//  Created by Lance Davenport on 10/23/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var curDayType:String = ""
    var curWeekDay:String = ""
    var curSchedule:String = ""
    let mySchedule:[String:String] = [
        "A": "CAS Physics",
        "B": "CAS Comp Sci",
        "C": "Calculus",
        "D": "English 4",
        "E": "CAS History",
        "F": "Design and Engineering",
        "Wed": "Life Skills",
        "G": "Free Period",
        "H": "Free Period",
        "I": "Free Period",
    ]
    
    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var Label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return dayType.count
        } else if component == 1{
            return weekDay.count
        } else {
            return Schedule.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return dayType[row]
        } else if component == 1{
            return weekDay[row]
        } else {
            return Schedule[row]
        }
    }
    
    
    
    @IBAction func getSchedule(_ sender: Any) {
        let dayTypeRow = PickerView.selectedRow(inComponent: 0)
        let ABCDay = dayType[dayTypeRow]
        let weekDayRow = PickerView.selectedRow(inComponent: 0)
        let dayOfWeek = weekDay[weekDayRow]
        
        let periodRotation:[String:[String:[String]]] = [
            "A": [
                "Monday": ["A", "B", "D", "E", "G", "H"],
                "Tuesday": ["A", "B", "D", "E", "G", "H"],
                "Wednesday": ["A", "B", "D", "E", "Wed", "Wed"],
                "Thursday": ["A", "B", "D", "E", "G", "H"],
                "Friday": ["A", "B", "D", "E", "G", "H"]
            ],
            "C": [
                "Monday": ["C", "A", "F", "D", "I", "G"],
                "Tuesday": ["C", "A", "F", "D", "I", "G"],
                "Wednesday": ["C", "A", "F", "D", "Wed", "Wed"],
                "Thursday": ["C", "A", "F", "D", "I", "G"],
                "Friday": ["C", "A", "F", "D", "I", "G"]
            ],
            "B": [
                "Monday": ["B", "C", "E", "F", "H", "I"],
                "Tuesday": ["B", "C", "E", "F", "H", "I"],
                "Wednesday": ["B", "C", "E", "F", "Wed", "Wed"],
                "Thursday": ["B", "C", "E", "F", "H", "I"],
                "Friday": ["B", "C", "E", "F", "H", "I"]
            ]
        ]
        let mySched = getScheduleForDay(periods: periodRotation[ABCDay]![dayOfWeek]!, mySchedule: mySchedule)
        Label.text = mySched
    }
    func getScheduleForDay(periods: [String], mySchedule:[String:String]) -> String{
        var output = ""
        for period in periods{
            output += "\(period) - "
            output += mySchedule[period] ?? "Free Period"
            output += "\n"
        }
        return output
    }
}
let Schedule = ["Regular", "Assembly", "Double Block"]
let dayType = ["A", "C", "B"]
let weekDay = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
