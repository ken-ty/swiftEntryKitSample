//
//  ButtonItem.swift
//  swiftEntryKitSample
//
//  Created by kenty on 2024/04/13.
//

import Foundation

final class ButtonItem {
    var title : String
    var action : () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
}
