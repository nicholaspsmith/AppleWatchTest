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
    
    var abs: [[String:[[String]]]] = [
        ["Hanging Leg Raise": [["body","x12"], ["body","x12"], ["body","x12"], ["body","x12"], ["body","x10"], ["body","x10"], ["body","x8"],  ["body","x6"],  ["body","x4"]]],
        ["Barbell landmine":   [["body","x20"], ["body","x20"], ["body","x16"], ["body","x16"], ["body","x12"], ["body","x12"], ["body","x10"], ["body","x10"], ["body","x5"]]],
        ["Crunch":             [["body","x18"], ["body","x18"], ["body","x16"], ["body","x16"], ["body","x15"], ["body","x15"], ["body","x12"], ["body","x12"], ["body","x10"]]],
        ["Plank":              [["body","1min"],["body","1min"],["body","50s"], ["body","45s"], ["body","40s"], ["body","30s"], ["body","25s"], ["body","20s"], ["body","20s"]]]
    ]


    @IBOutlet var zoomDayLabel: WKInterfaceLabel!
    @IBOutlet var movementTable: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        let dayName = context as! String
        
        self.zoomDayLabel.setText(dayName)
        
        
        if dayName == "Saturday" {
            let numRows = getSimpleWorkout()
            
            self.movementTable.setNumberOfRows(numRows, withRowType: "MovementRow")
            
            setRowLabels()
        }

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
                let weight = routine![j][0]
                row.weightLbl.setText(weight)
                let reps = routine![j][1]
                row.repsLbl.setText(reps)
            }
        }

    }

    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.movementTable.removeRowsAtIndexes(NSIndexSet(index: Int(rowIndex.value)))
    }

}
