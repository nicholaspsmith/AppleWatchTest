//
//  PickerIC.swift
//  WatchTest
//
//  Created by Nick on 1/31/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import WatchKit
import Foundation


class PickerIC: WKInterfaceController {
    
    @IBOutlet weak var myPicker: WKInterfacePicker!
    @IBOutlet weak var itemLabel: WKInterfaceLabel!
    
    var movementList: [(String, String)] = [
        ("Squat","350"),
        ("Bench","305"),
        ("Deadlift","425"),
        ("Press","185"),
    ]

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        itemLabel.setText(movementList[0].1)
        
        let pickerItems: [WKPickerItem] = movementList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            return pickerItem
        }
        myPicker.setItems(pickerItems)
    }

    @IBAction func pickerChanged(value: Int) {
        itemLabel.setText(movementList[value].1)
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
