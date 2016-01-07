//
//  InterfaceController.swift
//  WatchTest WatchKit Extension
//
//  Created by Nick on 1/6/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    let dayLabels = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.table.setNumberOfRows(self.dayLabels.count, withRowType: "TableRow")
        
        for index in 0..<self.dayLabels.count {
            let row = self.table.rowControllerAtIndex(index) as! TableRow
            row.rowLbl.setText(self.dayLabels[index])
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let day = dayLabels[rowIndex]
        self.pushControllerWithName("ZoomDayController", context: nil)
        print(day)
    }
}
