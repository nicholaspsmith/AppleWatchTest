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
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let dayName = context as!? String
        
        self.zoomDayLabel.setText(dayName)
    }

}
