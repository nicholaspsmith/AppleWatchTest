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

    @IBOutlet var zoomDayLabel: WKInterfaceLabel!
    @IBOutlet var movementTable: WKInterfaceTable!
    @IBOutlet var movementLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var currentMovementIndex: UInt? = 0

        let dayName = context as! String
        
        self.zoomDayLabel.setText(dayName)
        
        let workout = getWorkout(dayName, currIndex: currentMovementIndex!)
        
        self.movementLabel.setText(workout.movement)
//        self.movementLabel.setText(workout.weight)
//        self.movementLabel.setText(workout.reps)
    }
    
    func getWorkout(day:String, currIndex:UInt) -> (movement:String, weight:String, reps:String) {
        let movement = workout[day]![0].keys.first
        let weight = workout[day]![0][movement!]![0].keys.first
        let reps = workout[day]![0][movement!]![0][weight!]

        return (movement!, String(weight), reps!)
    }

}
