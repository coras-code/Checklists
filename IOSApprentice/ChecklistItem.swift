//
//  ChecklistItem.swift
//  IOSApprentice
//
//  Created by Novoda on 29/01/2019.
//  Copyright © 2019 cjm. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject  {
    var text = ""
    var checked = false

    func toggleChecked() {
        checked = !checked
    }
}
