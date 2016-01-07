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

    @IBOutlet var zoomDayLabel: WKInterfaceLabel!
    @IBOutlet var movementTable: WKInterfaceTable!
    @IBOutlet var movementLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let dayName = context as! String
        
        self.zoomDayLabel.setText(dayName)
        
        let workout = getWorkout(dayName)
        
        self.movementLabel.setText(workout.movement)
//        self.movementLabel.setText(workout.weight)
//        self.movementLabel.setText(workout.reps)
    }
    
    func getWorkout(day:String) -> (movement:String, weight:String, reps:String) {
        return ("Deadlifts", "350", "x1+")
    }

}
