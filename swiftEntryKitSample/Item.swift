//
//  Item.swift
//  swiftEntryKitSample
//
//  Created by kenty on 2024/04/13.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
