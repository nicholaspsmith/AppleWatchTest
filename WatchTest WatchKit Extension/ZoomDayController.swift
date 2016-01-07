//
//  ZoomDayController.swift
//  WatchTest
//
//  Created by Nick on 1/6/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import WatchKit
import Foundation


class ZoomDayController: WKInterfaceController {
    
    var workout: [String:[ [String: [[Int:String]] ] ]] = [
        "Monday": [
            ["Movement1": [[120:"x5"],[140:"x3"],[180:"x1+"]]],
            ["Movement2": [[10:"x5"],[40:"x3"],[80:"x1+"]]]
        ],
        "Tuesday": [
            ["Movement1": [[120:"x5"],[140:"x3"],[180:"x1+"]]],
            ["Movement2": [[10:"x5"],[40:"x3"],[80:"x1+"]]]
        ]
    ]
    
    var abs:[[String: [String] ] ] = [
        ["Hanging Leg Raise": ["x12",  "x12", "x12", "x12", "x10", "x10", "x8", "x6", "x4"]],
        ["Barbell landmine":  ["x20", "x20", "x16", "x16", "x12", "x12", "x10", "x10", "x5"]],
        ["Crunch":  ["x18", "x18", "x16", "x16", "x15", "x15", "x12", "x12", "x10"]],
        ["Plank": ["1min", "1min", "50s", "45s", "40s", "30s", "25s", "20s", "20s"]]
    ]

    @IBOutlet var zoomDayLabel: WKInterfaceLabel!
    @IBOutlet var movementTable: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        let dayName = context as! String
        
        self.zoomDayLabel.setText(dayName)
        
        let numRows = getSimpleWorkout()
        
        self.movementTable.setNumberOfRows(numRows, withRowType: "MovementRow")
        
        setRowLabels()
    }
    
    func getWorkout(day:String, currIndex:UInt) -> (movement:String, weight:String, reps:String) {
        let movement = workout[day]![0].keys.first
        let weight = workout[day]![0][movement!]![0].keys.first
        let reps = workout[day]![0][movement!]![0][weight!]

        return (movement!, String(weight), reps!)
    }
    
    func getSimpleWorkout() -> Int {
        var total = 0;
        for var i = 0; i < abs.count; i++ {
            let movement = abs[i].keys.first
            let routine = abs[i][movement!]
            for var j = 0; j < routine!.count; j++ {
                total++;
            }
        }
        return total;
    }
    
    func setRowLabels() {
        for var i = 0; i < abs.count; i++ {
            let movement = abs[i].keys.first
            let routine = abs[i][movement!]
            for var j = 0; j < routine!.count; j++ {
                let bigIndex = j + (i * abs[i][movement!]!.count)
                let row = self.movementTable.rowControllerAtIndex(bigIndex) as! MovementRow
                row.movementLabel.setText(movement)
                let reps = routine![j]
                row.repsLbl.setText(reps)
            }
        }

    }

    
    

}
