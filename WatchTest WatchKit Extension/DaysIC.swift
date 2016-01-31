//
//  DaysIC.swift
//  WatchTest
//
//  Created by Nick on 1/31/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import WatchKit
import Foundation


class DaysIC: WKInterfaceController {

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
        self.pushControllerWithName("ZoomDayController", context: day)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
